---
---

{%- include layout/data.liquid -%}


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

});
