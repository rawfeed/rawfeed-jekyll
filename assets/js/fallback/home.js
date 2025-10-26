---
---

{%- include layout/data.liquid -%}

document.addEventListener("DOMContentLoaded", () => {

  const terminal = document.getElementById("terminal");

  if (terminal) {

    // effects terminal: maximize
    // ----------------------------------------------------------------------------------------------
    const btnMax = terminal.querySelector(".terminal-header__max");

    let isFullscreen = false;

    // maximize/restore
    btnMax.addEventListener("click", () => {
      isFullscreen = !isFullscreen;
      terminal.classList.toggle("terminal-fullscreen", isFullscreen);
    });

    // populate the terminal
    // ----------------------------------------------------------------------------------------------
    const socialsEl = document.getElementById("terminal-screen--socials");
    const screen = document.getElementById("screen");

    const commands = {
      // Multiple string is the same as using ` in Javascript
      help: `{{ home_.terminal.help.menu }}`,
      about: document.getElementById("home-content").innerHTML,
      socials: socialsEl ? socialsEl.innerHTML : "{{ home_.terminal.no_socials }}"
    };

    const createInputLine = () => {
      const line = document.createElement("div");
      line.className = "line";

      const prompt = document.createElement("span");
      prompt.className = "prompt";
      prompt.textContent = "[{{ home_.terminal.user }}@{{ home_.terminal.hostname }} ~]$";

      // wrapper para conter input, cursor e measure
      const wrapper = document.createElement("span");
      wrapper.className = "input-wrapper";

      const input = document.createElement("input");
      input.type = "text";
      input.className = "input";
      input.placeholder = `{{ home_.terminal.welcome }}`;
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
        // Update position on keys that do not trigger input immediately (arrows, delete, etc.)
        setTimeout(updateCursor, 0);

        if (e.key === "Enter") {
          e.preventDefault();
          const cmd = input.value.trim().toLowerCase();
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

        } else if (e.key === "Escape") {
          e.preventDefault();
          screen.innerHTML = "";
          createInputLine();
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

    // processes commands
    const processCommand = (cmd) => {
      if (cmd === "help") {
        helpWriteHTML(commands.help, "html");
      } else if (cmd === "date") {
        commandsPrint(dateShow(), "text");
      // else if (cmd.startsWith("echo "))
      //   commandsPrint(cmd.split(" ").slice(1).join(" "))
      } else if (cmd === "about") {
        aboutWriteHTML(commands.about);
      } else if (cmd === "socials") {
        socialsWriteHTML(commands.socials);
      } else if (cmd === "clear") {
        screen.innerHTML = "";
      } else if (cmd) {
        commandsPrint(cmd + `{{ home_.terminal.error }}`, "text");
      }
    };

    const helpWriteHTML = (text, mode = "html") => {
      const wrapper = document.createElement("div");
      wrapper.className = "line-wrapper";
      const helpDescription = document.createElement("span");
      helpDescription.className = "help-description";
      helpDescription.innerHTML = `{{ home_.terminal.help.description | markdownify }}`;
      const helpCommandTitle = document.createElement("span");
      helpCommandTitle.className = "help-commands__title";
      helpCommandTitle.textContent = "{{ home_.terminal.help.commands.title }}";
      const helpCommandDesc = document.createElement("span");
      helpCommandDesc.className = "help-commands__desc";
      helpCommandDesc.textContent = `{{ home_.terminal.help.commands.description }}`;

      wrapper.appendChild(helpDescription);
      wrapper.appendChild(helpCommandTitle);
      wrapper.appendChild(helpCommandDesc);

      text.split("\n").forEach((t) => {
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
      socialsCommandDesc.textContent = `{{ socials_.description.terminal.command.description }}`;

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

    // when clicking on the terminal, it always focuses on the last existing input
    terminal.addEventListener("click", (e) => {
      // avoids focusing when clicking a header button, etc.
      const lastInput = screen.querySelector(".input:last-of-type");
      if (lastInput) lastInput.focus();
    });
  }
});
