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

  /* TOC
  # ------------------------------------------------------------------------------------------------
  */

  const toc = document.getElementById('toc');
  if (toc) {
    // Variável global de largura minima do TOC
    const minLayoutWidth = 1830;

    const sentinel = document.createElement('div');
    toc.parentNode.insertBefore(sentinel, toc);

    const shouldApplyFixed = () => window.innerWidth > minLayoutWidth;

    const observer = new IntersectionObserver(([entry]) => {
      if (shouldApplyFixed()) {
        if (!entry.isIntersecting) {
          toc.classList.add('toc-fixed');
        } else {
          toc.classList.remove('toc-fixed');
        }
      } else {
        toc.classList.remove('toc-fixed');
      }
    }, { threshold: 0 });

    observer.observe(sentinel);

    window.addEventListener('resize', () => {
      if (!shouldApplyFixed()) toc.classList.remove('toc-fixed');
    });

    const slugify = (text) => {
      if (!text) return '';
      return text.toString().toLowerCase().trim()
        .normalize('NFKD').replace(/[\u0300-\u036f]/g, '')
        .replace(/[^\w\s-]/g, '')
        .replace(/\s+/g, '-')
        .replace(/--+/g, '-');
    };

    const buildTOC = (tocEl) => {
      const selector = tocEl.dataset.tocSelector || '.post-content' || '.page-content';
      const maxLevel = parseInt(tocEl.dataset.tocMaxLevel || '3', 10);
      const offset = parseInt(tocEl.dataset.tocScrollOffset || '20', 10);

      const root = document.querySelector(selector);

      if (!root) {
        tocEl.querySelector('.toc-empty').textContent = `Content not found (${selector})`;
        tocEl.querySelector('.toc-empty').style.display = 'block';
        return;
      }

      const headings = Array.from(
        root.querySelectorAll(Array(maxLevel).fill(0).map((_, i) => `h${i + 1}`).join(','))
      )
        .filter((h) => !tocEl.contains(h))
        .filter((h) => parseInt(h.tagName.substring(1)) <= maxLevel);

      if (headings.length === 0) return;

      const tocRoot = tocEl.querySelector('.toc-list');
      tocRoot.innerHTML = '';

      const idCounts = {};
      for (const h of headings) {
        if (!h.id) {
          let id = slugify(h.textContent);
          if (!id) id = 'section';

          if (idCounts[id]) {
            idCounts[id] += 1;
            id = `${id}-${idCounts[id]}`;
          } else {
            idCounts[id] = 1;
          }

          h.id = id;
        }
      }

      const stack = [{ level: 0, ul: tocRoot }];
      for (let i = 0; i < headings.length; i++) {
        const h = headings[i];
        const level = parseInt(h.tagName.substring(1));
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
          const nextLevel = parseInt(next.tagName.substring(1));
          if (nextLevel > level) {
            const newUl = document.createElement('ul');
            li.appendChild(newUl);
            stack.push({ level, ul: newUl });
          }
        }
      }

      const links = tocRoot.querySelectorAll('a');
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
    };

    for (const tocEl of document.querySelectorAll('.toc')) {
      // Obtém os textos dos botões do dataset (agora dinâmicos)
      const btnShowText = tocEl.dataset.btnShow || 'Show';
      const btnHiddenText = tocEl.dataset.btnHidden || 'Hide';

      buildTOC(tocEl);

      const toggle = tocEl.querySelector('.toc-toggle');
      const wrapper = tocEl.querySelector('.toc-list-wrapper');

      wrapper.style.display = 'none';
      toggle.setAttribute('aria-expanded', 'false');
      toggle.textContent = btnShowText;

      toggle.addEventListener('click', () => {
        const expanded = toggle.getAttribute('aria-expanded') === 'true';
        wrapper.style.display = expanded ? 'none' : 'block';
        toggle.setAttribute('aria-expanded', (!expanded).toString());
        // Define o texto dinamicamente
        toggle.textContent = expanded ? btnShowText : btnHiddenText;
      });

      const tocTop = tocEl.offsetTop;

      const handleScrollFix = () => {
        if (window.innerWidth <= minLayoutWidth) {
          tocEl.classList.remove('fixed');
          tocEl.style.position = '';
          tocEl.style.top = '';
          tocEl.style.zIndex = '';
          tocEl.style.width = '';
          return;
        }

        const scrollTop = window.scrollY || document.documentElement.scrollTop;

        if (scrollTop >= tocTop) {
          tocEl.classList.add('fixed');
          tocEl.style.position = 'fixed';
          tocEl.style.top = '0';
          tocEl.style.zIndex = '9999';
        } else {
          tocEl.classList.remove('fixed');
          tocEl.style.position = '';
          tocEl.style.top = '';
          tocEl.style.width = '';
        }
      };

      // fechar TOC ao pressionar 'Esc'
      document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
          wrapper.style.display = 'none';
          toggle.setAttribute('aria-expanded', 'false');
          toggle.textContent = btnShowText;
        }
      });

      window.addEventListener('scroll', handleScrollFix, { passive: true });
      window.addEventListener('resize', handleScrollFix);
      handleScrollFix();
    }
  }

});
