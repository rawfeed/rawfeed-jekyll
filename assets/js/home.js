---
---

{%- include assigned -%}

document.addEventListener("DOMContentLoaded", () => {

  const localeData = {{ site.data.screen.locales | jsonify }};
  const mergeLocale = (base, overlay) => {
    if (Array.isArray(base) && Array.isArray(overlay)) return base.map((value, index) => mergeLocale(value, overlay[index] || {}));
    if (!base || !overlay || typeof base !== 'object' || typeof overlay !== 'object') return overlay ?? base;
    return Object.fromEntries([...new Set([...Object.keys(base), ...Object.keys(overlay)])].map((key) => [key, mergeLocale(base[key], overlay[key])]));
  };
  const activeLocale = document.body.dataset.activeLanguage || 'en';
  const interfaceConfig = mergeLocale({{ site.data.screen.interface.interface | jsonify }}, localeData[activeLocale]?.interface);
  const homeConfig = mergeLocale({{ site.data.screen.home.home | jsonify }}, localeData[activeLocale]?.home);
  const configuredProjects = mergeLocale({{ site.data.screen.projects.projects | jsonify }}, localeData[activeLocale]?.projects);
  const commandHistory = [];
  let historyIndex = 0;
  const terminal = document.getElementById("terminal");

  if (terminal) {

    // populate the terminal
    // ----------------------------------------------------------------------------------------------
    const socialsEl = document.getElementById("terminal-screen--socials");
    const screen = document.getElementById("screen");
    const clearScreen = () => screen.querySelectorAll(":scope > .line, :scope > .line-wrapper").forEach((node) => node.remove());

    const commands = {
      // Multiple string is the same as using ` in Javascript
      help: homeConfig.terminal.help.menu,
      about: document.getElementById("home-content").innerHTML,
      socials: socialsEl ? socialsEl.innerHTML : homeConfig.terminal.no_socials
    };

    const createInputLine = () => {
      const line = document.createElement("div");
      line.className = "line";

      const prompt = document.createElement("span");
      prompt.className = "prompt";
      prompt.textContent = `[${homeConfig.terminal.user}@${homeConfig.terminal.hostname} ~]${homeConfig.terminal.signal}`;

      // wrapper para conter input, cursor e measure
      const wrapper = document.createElement("span");
      wrapper.className = "input-wrapper";

      const input = document.createElement("input");
      input.type = "text";
      input.className = "input";
      input.placeholder = homeConfig.terminal.welcome;
      input.spellcheck = false;
      input.autocomplete = "off";
      input.autocorrect = "off";
      input.autocapitalize = "off";

      const cursor = document.createElement("span");
      cursor.className = "cursor";

      const measure = document.createElement("span");
      measure.className = "measure";

      wrapper.appendChild(input);
      wrapper.appendChild(cursor);
      wrapper.appendChild(measure);

      line.appendChild(prompt);
      line.appendChild(wrapper);
      screen.appendChild(line);

      input.focus();
      screen.scrollTop = screen.scrollHeight;

      // Updates the fake cursor position based on the input"s selectionStart
      const updateCursor = () => {
        const sel = input.selectionStart || 0;
        // measure the text to the position of the caret
        measure.textContent = input.value.slice(0, sel);
        const textWidth = measure.offsetWidth; // largura do texto sem scroll
        const visibleLeft = textWidth - input.scrollLeft;
        cursor.style.left = `${visibleLeft}px`;

        // ensure the caret is visible (for long texts): adjust input"s scrollLeft
        const paddingRight = 10;
        if (textWidth - input.scrollLeft > input.clientWidth - paddingRight) {
          input.scrollLeft = textWidth - input.clientWidth + paddingRight;
          cursor.style.left = `${textWidth - input.scrollLeft}px`;
        } else if (textWidth < input.scrollLeft) {
          input.scrollLeft = textWidth;
          cursor.style.left = `${textWidth - input.scrollLeft}px`;
        }
      };

      // show/hide cursor animation as focus changes
      const onFocus = () => {
        cursor.style.opacity = "1";
        updateCursor();
      };

      const onBlur = () => {
        cursor.style.opacity = "0";
      };

      input.addEventListener("input", updateCursor);

      input.addEventListener("keydown", (e) => {
        if (e.ctrlKey && !e.metaKey && e.key.toLowerCase() === "l") {
          e.preventDefault();
          clearScreen();
          createInputLine();
          return;
        }
        // Update position on keys that do not trigger input immediately (arrows, delete, etc.)
        setTimeout(updateCursor, 0);

        if (e.key === "ArrowUp" || e.key === "ArrowDown") {
          e.preventDefault();
          historyIndex = Math.max(0, Math.min(commandHistory.length, historyIndex + (e.key === "ArrowUp" ? -1 : 1)));
          input.value = commandHistory[historyIndex] || "";
          updateCursor();
          return;
        }
        if (e.key === "Enter") {
          e.preventDefault();
          const rawCommand = input.value.trim();
          const cmd = rawCommand;
          if (cmd) { commandHistory.push(rawCommand); historyIndex = commandHistory.length; }
          if (cmd) {
            // remove input/cursor/measure and place fixed text
            wrapper.removeChild(input);
            wrapper.removeChild(cursor);
            wrapper.removeChild(measure);
            const cmdText = document.createElement("span");
            cmdText.textContent = cmd;
            wrapper.appendChild(cmdText);
            processCommand(cmd);
          } else {
            // if you enter without command, it just creates a new empty line (with prompt)
            wrapper.removeChild(input);
            wrapper.removeChild(cursor);
            wrapper.removeChild(measure);
            const blank = document.createElement("span");
            blank.textContent = "";
            wrapper.appendChild(blank);
          }

          // New line input
          createInputLine();

        } else if (e.key === "Tab") {
          e.preventDefault();
          completeCommand(input);
        } else if (e.key === "Escape") {
          e.preventDefault();
          document.getElementById("rf-terminal").close();
        }
      });

      // arrows, mouse click, mouseup (position caret), etc.
      input.addEventListener("keyup", updateCursor);
      input.addEventListener("click", () => setTimeout(updateCursor, 0));
      input.addEventListener("mouseup", () => setTimeout(updateCursor, 0));
      input.addEventListener("focus", onFocus);
      input.addEventListener("blur", onBlur);

      updateCursor();
    };

    // function show date
    function dateShow() {
      const langBrowser = navigator.language || navigator.userLanguage;

      const options = {
        weekday: 'long',
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
      };

      let brMessage = "";

      if (langBrowser === "pt-BR" ) {
        brMessage = " (Horário de Brasília)";
      }

      try {
        return new Date().toLocaleString(langBrowser, options) + brMessage;
      } catch (e) {
        // Fallback for en-US
        return new Date().toLocaleString('en-US', options) + brMessage;
      }
    }

    const availablePages = {{ site.pages | where_exp: 'item', 'item.published != false' | jsonify }};
    const configuredPages = availablePages.filter(item => item.title && item.url && item.url !== '/404.html' && (!item.url.startsWith('/blog/tags/') || item.url === '/blog/tags/'));
    const configuredPosts = {{ site.posts | jsonify }};
    const configuredPixels = {{ site.pixels | jsonify }};
    const customCommands = interfaceConfig.commands || {};
    const aliases = interfaceConfig.command_aliases || {};
    const commandNames = ['help','ls','open','projects','socials','contact','theme','lang','about','date','find','clear','shred','home','scan','boot','echo','whoami','neofetch','exit', ...Object.keys(customCommands)].sort();
    const normalize = name => Object.keys(aliases).find(alias => alias.toLowerCase() === name.toLowerCase()) ? String(aliases[Object.keys(aliases).find(alias => alias.toLowerCase() === name.toLowerCase())]).toLowerCase() : name.toLowerCase();
    const printText = value => commandsPrint(String(value ?? ''), 'text');
    const currentLanguage = () => localStorage.getItem('rf-language') || interfaceConfig.language || 'en';
    const currentTheme = () => document.documentElement.dataset.theme || 'dark';
    let searchDocuments;
    let searchDocumentsRequest;
    const searchIndexUrl = document.body.dataset.searchIndex || {{ '/assets/json/site_search.json' | relative_url | jsonify }};
    async function findCommand(rawQuery) {
      const query = String(rawQuery || '').trim().replace(/^(?:"([\s\S]*)"|'([\s\S]*)')$/, (_, doubleQuoted, singleQuoted) => doubleQuoted ?? singleQuoted ?? '').trim();
      if (!query) { printText(interfaceConfig.labels?.terminal_find_usage || 'Usage: find "text"'); return; }
      try {
        if (!searchDocumentsRequest) {
          searchDocumentsRequest = fetch(searchIndexUrl).then((response) => {
            if (!response.ok) throw new Error('Search index unavailable');
            return response.json();
          }).then((documents) => { searchDocuments = documents; return documents; }).catch((error) => { searchDocumentsRequest = null; throw error; });
        }
        const documents = searchDocuments || await searchDocumentsRequest;
        const needle = query.toLocaleLowerCase(currentLanguage());
        const limit = Number(interfaceConfig.search_limit) || 50;
        const matches = documents.filter((document) => `${document.title} ${document.text}`.toLocaleLowerCase(currentLanguage()).includes(needle)).slice(0, limit);
        const wrapper = document.createElement('div');
        wrapper.className = 'line-wrapper terminal-search-results';
        if (!matches.length) {
          const line = document.createElement('div');
          line.className = 'line';
          line.textContent = (interfaceConfig.labels?.terminal_find_empty || 'No results for "{query}".').replace('{query}', query);
          wrapper.append(line);
        } else {
          matches.forEach((match) => {
            const line = document.createElement('div');
            line.className = 'line';
            const link = document.createElement('a');
            link.href = match.url;
            link.textContent = match.title;
            line.append(link);
            wrapper.append(line);
          });
        }
        const activePrompt = screen.querySelector('.input')?.closest('.line');
        screen.insertBefore(wrapper, activePrompt || null);
        screen.scrollTop = screen.scrollHeight;
      } catch (_) {
        printText(interfaceConfig.labels?.search_unavailable || 'Search unavailable. Try again.');
      }
    }
    function runConfiguredCommand(raw) {
      const input = raw.trim();
      if (!input) return;
      const [first, ...rest] = input.split(/\s+/);
      let command = normalize(first);
      const arg = rest.join(' ');
      const aliasesToNames = Object.fromEntries(Object.entries(aliases).map(([alias, name]) => [alias.toLowerCase(), name.toLowerCase()]));
      command = aliasesToNames[first.toLowerCase()] || command;
      if (Object.prototype.hasOwnProperty.call(customCommands, command) && command !== 'help') { printText(customCommands[command]); return; }
      switch (command) {
        case 'help': helpWriteHTML(homeConfig.terminal.help.menu, 'text'); break;
        case 'whoami': printText(homeConfig.terminal.user); break;
        case 'neofetch': printText(`${homeConfig.terminal.user}@${homeConfig.terminal.hostname}\nTheme: ${currentTheme()}\nLanguage: ${currentLanguage()}\nPages: ${configuredPages.length}`); break;
        case 'ls': {
          const pageLines = configuredPages.map(item => `${item.url}\t${item.title}`);
          printText([`Pages (${pageLines.length}):`, ...pageLines].join('\n'));
          break;
        }
        case 'open': {
          if (!arg) { printText('Usage: open <page slug>'); break; }
          const target = arg.replace(/^\/+|\/+$/g, '').replace(/^#/, '').toLowerCase();
          const item = [...configuredPages, ...configuredPosts, ...configuredPixels].find(entry => {
            const url = String(entry.url || entry.permalink || '').replace(/^\/+|\/+$/g, '').toLowerCase();
            const slug = String(entry.slug || entry.title || '').toLowerCase().replace(/\s+/g, '-');
            return url === target || slug === target || url.split('/').pop() === target;
          });
          if (item) location.href = item.url || item.permalink;
          else printText(`Page not found: ${arg}. Run ls to see available pages.`);
          break;
        }
        case 'projects': {
          const projects = configuredProjects || interfaceConfig.projects || [];
          printText(projects.length ? projects.map(project => `${project.name}\t${project.url || project.repository || ''}\t${project.description || ''}`).join('\n') : 'No projects are configured. Add projects in _data/screen/projects.yml.');
          break;
        }
        case 'socials': socialsWriteHTML(commands.socials); break;
        case 'contact': {
          const page = configuredPages.find(item => /(^|\/)contact(\/|$)/i.test(item.url));
          if (page) location.href = page.url; else printText('No contact page is configured.');
          break;
        }
        case 'theme': {
          const next = arg === 'dark' || arg === 'light' ? arg : arg ? null : currentTheme() === 'dark' ? 'light' : 'dark';
          if (!next) { printText('Usage: theme [dark|light]'); break; }
          document.documentElement.dataset.theme = next;
          try { localStorage.setItem('theme', next); } catch (_) {}
          printText(`Theme set to ${next}.`);
          break;
        }
        case 'lang': {
          const supported = Array.from(document.querySelectorAll('[data-language]'), item => item.dataset.language);
          if (!supported.includes(arg)) { printText(`Usage: lang <${supported.join('|')}>`); break; }
          document.querySelector(`[data-language="${CSS.escape(arg)}"]`)?.click();
          printText(`Language set to ${arg}.`);
          break;
        }
        case 'about': aboutWriteHTML(commands.about); break;
        case 'date': printText(new Date().toLocaleString(currentLanguage() === 'pt' ? 'pt-BR' : currentLanguage())); break;
        case 'find': findCommand(arg); break;
        case 'clear': clearScreen(); break;
        case 'shred': {
          printText(interfaceConfig.shred_message || 'Overwriting screen in 3 passes…');
          setTimeout(() => {
            document.getElementById('rf-terminal').close();
            setTimeout(() => document.dispatchEvent(new CustomEvent('rf:shred')), 260);
          }, 700);
          break;
        }
        case 'home': location.href = {{ '/' | relative_url | jsonify }}; break;
        case 'scan': document.querySelector('[data-setting="scan"]')?.click(); printText(`Scanlines ${document.documentElement.classList.contains('scan') ? 'enabled' : 'disabled'}.`); break;
        case 'boot': document.querySelector('[data-effect="replay"]')?.click(); break;
        case 'echo': printText(arg); break;
        case 'exit': document.getElementById('rf-terminal').close(); break;
        default: printText(`${command}${homeConfig.terminal.error}`);
      }
    }
    function processCommand(raw) {
      const [first, ...rest] = raw.trim().split(/\s+/);
      const command = normalize(first || '');
      if (command === 'sudo') {
        if (/\brm\b/i.test(rest.join(' '))) { printText(interfaceConfig.sudo_message || 'Permission denied.'); return; }
        printText(interfaceConfig.sudo_message || 'This browser terminal does not provide elevated access.');
        return;
      }
      runConfiguredCommand(raw);
    }
    function completeCommand(input) {
      const value = input.value.trimStart();
      if (!value) return;
      const openMatch = value.match(/^open\s+(\S*)$/i);
      if (openMatch) {
        const matches = configuredPages.filter(item => String(item.slug || item.url.split('/').filter(Boolean).pop()).toLowerCase().startsWith(openMatch[1].toLowerCase()));
        if (matches.length === 1) input.value = `open ${matches[0].slug || matches[0].url.split('/').filter(Boolean).pop()}`;
      } else if (!value.includes(' ')) {
        const matches = commandNames.filter(name => name.startsWith(value.toLowerCase()));
        if (matches.length === 1) input.value = matches[0];
      }
      input.dispatchEvent(new Event('input', {bubbles:true}));
    }

    const helpWriteHTML = (text, mode = "html") => {
      const wrapper = document.createElement("div");
      wrapper.className = "line-wrapper";
      const helpDescription = document.createElement("span");
      helpDescription.className = "help-description";
      helpDescription.innerHTML = `{{ home.terminal.help.description | markdownify }}`;
      const helpCommandTitle = document.createElement("span");
      helpCommandTitle.className = "help-commands__title";
      helpCommandTitle.textContent = "{{ home.terminal.help.commands.title }}";
      const helpCommandDesc = document.createElement("span");
      helpCommandDesc.className = "help-commands__desc";
      helpCommandDesc.textContent = `{{ home.terminal.help.commands.description }}`;

      wrapper.appendChild(helpDescription);
      wrapper.appendChild(helpCommandTitle);
      wrapper.appendChild(helpCommandDesc);

      const helpLines = interfaceConfig.command_help || {};
      const helpText = commandNames.map(name => `${name.padEnd(18, ' ')}${helpLines[name] || ''}`).join('\n');
      (text || helpText).split("\n").forEach((t) => {
        const line = document.createElement("div");
        line.className = "line";
        if (mode === "html") line.innerHTML = t; else line.textContent = t;
        wrapper.appendChild(line);
      });

      screen.appendChild(wrapper);
      screen.scrollTop = screen.scrollHeight;
    };

    const socialsWriteHTML = (content, mode = "html") => {
      const wrapper = document.createElement("div");
      wrapper.className = "line-wrapper";
      const socialsCommandDesc = document.createElement("span");
      socialsCommandDesc.className = "socials-command__desc";
      socialsCommandDesc.textContent = `{{ socials.description.terminal.command.description }}`;

      screen.appendChild(socialsCommandDesc);

      if (mode === "html") wrapper.innerHTML = content; else wrapper.textContent = content;

      screen.appendChild(wrapper);
      screen.scrollTop = screen.scrollHeight;
    };

    const aboutWriteHTML = (content, mode = "html") => {
      const wrapper = document.createElement("div");
      wrapper.className = "line-wrapper";
      if (mode === "html") wrapper.innerHTML = content; else wrapper.textContent = content;
      screen.appendChild(wrapper);
      screen.scrollTop = screen.scrollHeight;
    };

    const commandsPrint = (text, mode = "html") => {
      // creates the wrapper to group all the lines
      const wrapper = document.createElement("div");
      wrapper.className = "line-wrapper";

      text.split("\n").forEach((t) => {
        const line = document.createElement("div");
        line.className = "line";
        if (mode === "html") line.innerHTML = t; else line.textContent = t;
        wrapper.appendChild(line);
      });

      screen.appendChild(wrapper);
      screen.scrollTop = screen.scrollHeight;
    };

    // start terminal
    createInputLine();

    const terminalDialog = terminal.closest("dialog");
    terminalDialog?.addEventListener("close", () => {
      clearScreen();
    });
    document.addEventListener("rf:terminal-open", () => {
      if (!screen.querySelector(".input")) createInputLine();
    });

    // when clicking on the terminal, it always focuses on the last existing input
    terminal.addEventListener("click", (e) => {
      const lastInput = screen.querySelector(".input:last-of-type");
      if (lastInput) lastInput.focus();
    });
  }
});
