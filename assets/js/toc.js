---
---

{%- include assigned -%}

document.addEventListener("DOMContentLoaded", () => {

  /* Automatic TOC
  # ------------------------------------------------------------------------------------------------
  */

  function initAutoTOC() {
    const selector = '.post-content, .page-content';
    const content = document.querySelector(selector);
    if (!content) return;

    const maxLevel = 3;
    const headings = Array.from(content.querySelectorAll('h1, h2, h3'))
      .filter(h => parseInt(h.tagName[1]) <= maxLevel);

    if (headings.length === 0) return;

    // Create TOC container
    const tocContainer = document.createElement('nav');
    tocContainer.id = 'auto-toc';
    tocContainer.className = 'auto-toc';

    // Create Bars (risquinhos) - Minimized State
    const barsContainer = document.createElement('div');
    barsContainer.className = 'auto-toc-bars';
    for (let i = 0; i < 20; i++) {
      const bar = document.createElement('div');
      bar.className = 'toc-bar';
      barsContainer.appendChild(bar);
    }
    tocContainer.appendChild(barsContainer);

    // Create Content Wrapper - Expanded State
    const contentWrapper = document.createElement('div');
    contentWrapper.className = 'auto-toc-content';

    const title = document.createElement('h2');
    title.textContent = '{{ page_data.toc.title }}';
    contentWrapper.appendChild(title);

    const tocList = document.createElement('ul');
    tocList.className = 'auto-toc-list';
    contentWrapper.appendChild(tocList);

    const slugify = (text) => {
      if (!text) return '';
      return text.toString().toLowerCase().trim()
        .normalize('NFKD').replace(/[\u0300-\u036f]/g, '')
        .replace(/[^\w\s-]/g, '')
        .replace(/\s+/g, '-')
        .replace(/--+/g, '-');
    };

    const idCounts = {};
    const offset = 20;

    const stack = [{ level: 0, ul: tocList }];

    headings.forEach((h, i) => {
      if (!h.id) {
        let id = slugify(h.textContent);
        if (!id) id = 'section';
        if (idCounts[id]) {
          idCounts[id]++;
          id = `${id}-${idCounts[id]}`;
        } else {
          idCounts[id] = 1;
        }
        h.id = id;
      }

      const level = parseInt(h.tagName[1]);
      const li = document.createElement('li');
      const a = document.createElement('a');
      a.href = `#${h.id}`;
      a.textContent = h.textContent.trim();

      a.addEventListener('click', (e) => {
        e.preventDefault();
        window.scrollTo({
          top: h.getBoundingClientRect().top + window.scrollY - offset,
          behavior: 'smooth'
        });
        history.replaceState(null, '', `#${h.id}`);
      });

      li.appendChild(a);

      while (stack.length > 1 && level <= stack[stack.length - 1].level) {
        stack.pop();
      }

      const parent = stack[stack.length - 1].ul;
      parent.appendChild(li);

      const next = headings[i + 1];
      if (next) {
        const nextLevel = parseInt(next.tagName[1]);
        if (nextLevel > level) {
          const newUl = document.createElement('ul');
          li.appendChild(newUl);
          stack.push({ level, ul: newUl });
        }
      }
    });

    tocContainer.appendChild(contentWrapper);
    document.body.appendChild(tocContainer);

    // Active link highlighting
    const links = tocList.querySelectorAll('a');
    const onScroll = () => {
      const fromTop = window.scrollY + offset + 1;
      let current = headings[0];
      for (const h of headings) {
        if (h.offsetTop <= fromTop) current = h;
      }
      for (const l of links) {
        l.classList.toggle('active', l.getAttribute('href') === `#${current.id}`);
      }
    };

    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();
  }

  initAutoTOC();
});
