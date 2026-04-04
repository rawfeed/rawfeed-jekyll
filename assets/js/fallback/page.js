---
---


document.addEventListener("DOMContentLoaded", () => {

  /* details
  # ------------------------------------------------------------------------------------------------
  */
  const detailsStart = document.getElementById("details-start");

  if (detailsStart) {
    if (window.__jekyll_details_setup) return;
      window.__jekyll_details_setup = true;

      function initDetails(){
        const starts = document.querySelectorAll('.details-start');
        starts.forEach(start => {
          const summary = start.getAttribute('data-summary') || 'Detalhes';

          let end = start.nextSibling;
          while(end && !(end.nodeType === 1 && end.classList.contains('details-end'))){
            end = end.nextSibling;
          }
          if(!end) return;

          let node = start.nextSibling;
          const content = [];
          while(node && node !== end){
            const next = node.nextSibling;
            if(node.nodeType === Node.ELEMENT_NODE || (node.nodeType === Node.TEXT_NODE && node.textContent.trim())){
              content.push(node.cloneNode(true));
            }
            node = next;
          }

          const details = document.createElement('details');
          const sum = document.createElement('summary');
          sum.textContent = summary;
          details.appendChild(sum);

          const wrapper = document.createElement('div');
          wrapper.className = 'details-content-wrapper';

          content.forEach(el => wrapper.appendChild(el));

          details.appendChild(wrapper);

          start.parentNode.insertBefore(details, start);
          let cur = start;
          while(cur){
            const next = cur.nextSibling;
            cur.remove();
            if(cur === end) break;
            cur = next;
          }
        });
      }

      if(document.readyState === 'loading')
        document.addEventListener('DOMContentLoaded', initDetails);
      else
        initDetails();
  }

  /* tabs
  # ------------------------------------------------------------------------------------------------
  */
  const tabsStart = document.getElementById("tabs-start");

  if (tabsStart) {
    if (window.__simple_tabs_installed) return;
      window.__simple_tabs_installed = true;

      function processTabs() {
        var starts = Array.from(document.querySelectorAll('.tabs-start'));
        starts.forEach(function (start) {
          var end = start.nextSibling;
          while (end && !(end.nodeType === 1 && end.classList && end.classList.contains('tabs-end'))) {
            end = end.nextSibling;
          }
          if (!end) return;

          var node = start.nextSibling;
          var tabs = [];
          var currentTab = null;
          while (node && node !== end) {
            var next = node.nextSibling;
            if (node.nodeType === Node.TEXT_NODE && !node.textContent.trim()) {
              node = next; continue;
            }
            var text = (node.textContent || '').trim();
            var m = text.match(/^\s*tab\d*\s*:\s*(.+)$/i);
            if (m) {
              currentTab = { title: m[1].trim(), nodes: [] };
              tabs.push(currentTab);
              if (node.parentNode) node.parentNode.removeChild(node);
            } else if (currentTab) {
              currentTab.nodes.push(node);
            } else {
            }
            node = next;
          }

          if (tabs.length === 0) {
            return;
          }

          var wrap = document.createElement('div');
          wrap.className = 'tabs-wrap';

          var nav = document.createElement('div');
          nav.className = 'tabs-nav';

          var panels = document.createElement('div');
          panels.className = 'tabs-panels';

          tabs.forEach(function (tab, i) {
            var btn = document.createElement('button');
            btn.type = 'button';
            btn.className = 'tab-btn' + (i === 0 ? ' active' : '');
            btn.setAttribute('data-idx', i);
            btn.textContent = tab.title;
            btn.addEventListener('click', function () {
              var idx = +this.getAttribute('data-idx');
              wrap.querySelectorAll('.tab-btn').forEach(function (b) {
                b.classList.toggle('active', +b.getAttribute('data-idx') === idx);
              });
              wrap.querySelectorAll('.tab-panel').forEach(function (p, pi) {
                p.classList.toggle('active', pi === idx);
              });
            });
            nav.appendChild(btn);

            var panel = document.createElement('div');
            panel.className = 'tab-panel' + (i === 0 ? ' active' : '');
            tab.nodes.forEach(function (n) {
              panel.appendChild(n.cloneNode(true));
            });
            panels.appendChild(panel);
          });

          wrap.appendChild(nav);
          wrap.appendChild(panels);

          start.parentNode.insertBefore(wrap, start);

          var cur = start;
          while (cur) {
            var nx = cur.nextSibling;
            if (cur.parentNode) cur.parentNode.removeChild(cur);
            if (cur === end) break;
            cur = nx;
          }
        });
      }

      if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', processTabs);
      else processTabs();
  }

  /* chart
  # ------------------------------------------------------------------------------------------------
  */

  const chart_elements = document.querySelectorAll('[id^="chart-"]');

  for (const ctx of chart_elements) {
    const data = ctx.dataset;

    new Chart(ctx, {
      type: data.type,
      data: {
        labels: data.labels.split(","),
        datasets: [
          {
            label: data.label,
            data: data.data.split(",").map(Number),
            borderColor: data.color,
            backgroundColor: `${data.color}33`,
            fill: true,
            tension: 0.3,
            borderWidth: 2,
            pointRadius: 4,
            pointHoverRadius: 6
          }
        ]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            display: true,
            labels: {
              color: "#444444"
            }
          }
        },
        scales: {
          x: {
            ticks: {
              color: "#131313"
            },
            grid: {
              color: "#111111"
            }
          },
          y: {
            ticks: {
              color: "#131313"
            },
            grid: {
              color: "#111111"
            }
          }
        }
      }
    });
  }

  /* Automatic TOC (ChatGPT Style)
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
    title.textContent = 'Navegação';
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
