---
---

document.addEventListener "DOMContentLoaded", ->

  ### details
  # ------------------------------------------------------------------------------------------------
  ###
  detailsStart = document.getElementById "details-start"

  if detailsStart
    return if window.__jekyll_details_setup
    window.__jekyll_details_setup = true

    initDetails = ->
      starts = document.querySelectorAll ".details-start"
      starts.forEach (start) ->

        summary = start.getAttribute("data-summary") or "Detalhes"

        end = start.nextSibling
        while end and not (end.nodeType is 1 and end.classList.contains("details-end"))
          end = end.nextSibling
        return unless end

        node = start.nextSibling
        content = []

        while node and node isnt end
          nextNode = node.nextSibling
          if node.nodeType is Node.ELEMENT_NODE or (node.nodeType is Node.TEXT_NODE and node.textContent.trim())
            content.push node.cloneNode(true)
          node = nextNode

        details = document.createElement "details"
        sum = document.createElement "summary"
        sum.textContent = summary
        details.appendChild sum

        wrapper = document.createElement "div"
        wrapper.className = "details-content-wrapper"

        content.forEach (el) -> wrapper.appendChild el
        details.appendChild wrapper

        start.parentNode.insertBefore details, start

        cur = start
        while cur
          nextNode = cur.nextSibling
          cur.remove()
          break if cur is end
          cur = nextNode

    if document.readyState is "loading"
      document.addEventListener "DOMContentLoaded", initDetails
    else
      initDetails()

  ### tabs
  # ------------------------------------------------------------------------------------------------
  ###
  tabsStart = document.getElementById "tabs-start"

  if tabsStart
    return if window.__simple_tabs_installed
    window.__simple_tabs_installed = true

    processTabs = ->
      starts = Array.from document.querySelectorAll ".tabs-start"

      starts.forEach (start) ->

        end = start.nextSibling
        while end and not (end.nodeType is 1 and end.classList and end.classList.contains("tabs-end"))
          end = end.nextSibling
        return unless end

        node = start.nextSibling
        tabs = []
        currentTab = null

        while node and node isnt end
          nextNode = node.nextSibling

          if node.nodeType is Node.TEXT_NODE and not node.textContent.trim()
            node = nextNode
            continue

          text = (node.textContent or "").trim()
          m = text.match /^\s*tab\d*\s*:\s*(.+)$/i

          if m
            currentTab =
              title: m[1].trim()
              nodes: []
            tabs.push currentTab
            node.parentNode.removeChild node if node.parentNode
          else if currentTab
            currentTab.nodes.push node

          node = nextNode

        return if tabs.length is 0

        wrap = document.createElement "div"
        wrap.className = "tabs-wrap"

        nav = document.createElement "div"
        nav.className = "tabs-nav"

        panels = document.createElement "div"
        panels.className = "tabs-panels"

        tabs.forEach (tab, i) ->
          btn = document.createElement "button"
          btn.type = "button"
          btn.className = "tab-btn" + if i is 0 then " active" else ""
          btn.setAttribute "data-idx", i
          btn.textContent = tab.title

          btn.addEventListener "click", ->
            idx = +@getAttribute "data-idx"

            wrap.querySelectorAll(".tab-btn").forEach (b) ->
              b.classList.toggle "active", +b.getAttribute("data-idx") is idx

            wrap.querySelectorAll(".tab-panel").forEach (p, pi) ->
              p.classList.toggle "active", pi is idx

          nav.appendChild btn

          panel = document.createElement "div"
          panel.className = "tab-panel" + if i is 0 then " active" else ""
          tab.nodes.forEach (n) ->
            panel.appendChild n.cloneNode true

          panels.appendChild panel

        wrap.appendChild nav
        wrap.appendChild panels

        start.parentNode.insertBefore wrap, start

        cur = start
        while cur
          nx = cur.nextSibling
          cur.parentNode.removeChild cur if cur.parentNode
          break if cur is end
          cur = nx

    if document.readyState is "loading"
      document.addEventListener "DOMContentLoaded", processTabs
    else
      processTabs()

  ### chart
  # ------------------------------------------------------------------------------------------------
  ###
  chart_elements = document.querySelectorAll '[id^="chart-"]'

  for ctx in chart_elements
    data = ctx.dataset

    new Chart ctx,
      type: data.type
      data:
        labels: data.labels.split ","
        datasets: [
          label: data.label
          data: data.data.split(",").map Number
          borderColor: data.color
          backgroundColor: "#{data.color}33"
          fill: true
          tension: 0.3
          borderWidth: 2
          pointRadius: 4
          pointHoverRadius: 6
        ]
      options:
        responsive: true
        plugins:
          legend:
            display: true
            labels:
              color: "#444444"
        scales:
          x:
            ticks:
              color: "#131313"
            grid:
              color: "#111111"
          y:
            ticks:
              color: "#131313"
            grid:
              color: "#111111"


  ### TOC
  # ------------------------------------------------------------------------------------------------
  ###
  toc = document.getElementById 'toc'

  if toc
    # Variável global de largura minima do TOC
    minLayoutWidth = 1830

    sentinel = document.createElement 'div'
    toc.parentNode.insertBefore sentinel, toc

    shouldApplyFixed = ->
      window.innerWidth > minLayoutWidth

    observer = new IntersectionObserver ([entry]) ->
      if shouldApplyFixed()
        unless entry.isIntersecting
          toc.classList.add 'toc-fixed'
        else
          toc.classList.remove 'toc-fixed'
      else
        toc.classList.remove 'toc-fixed'
    , threshold: 0

    observer.observe sentinel

    window.addEventListener 'resize', ->
      toc.classList.remove 'toc-fixed' unless shouldApplyFixed()

    slugify = (text) ->
      return '' unless text
      text.toString().toLowerCase().trim()
        .normalize('NFKD')
        .replace(/[\u0300-\u036f]/g, '')
        .replace(/[^\w\s-]/g, '')
        .replace(/\s+/g, '-')
        .replace(/--+/g, '-')

    buildTOC = (tocEl) ->
      selector = tocEl.dataset.tocSelector or '.post-content' or '.page-content'
      maxLevel = parseInt(tocEl.dataset.tocMaxLevel or '3', 10)
      offset = parseInt(tocEl.dataset.tocScrollOffset or '20', 10)

      root = document.querySelector selector

      unless root
        tocEl.querySelector('.toc-empty').textContent = "Content not found (#{selector})"
        tocEl.querySelector('.toc-empty').style.display = 'block'
        return

      headings = Array.from(root.querySelectorAll(Array(maxLevel).fill(0).map((_, i) -> "h#{i + 1}").join(',')))
        .filter (h) -> not tocEl.contains h
        .filter (h) -> parseInt(h.tagName.substring(1)) <= maxLevel

      return if headings.length is 0

      tocRoot = tocEl.querySelector '.toc-list'
      tocRoot.innerHTML = ''

      idCounts = {}

      for h in headings
        unless h.id
          id = slugify h.textContent
          id = 'section' unless id

          if idCounts[id]
            idCounts[id] += 1
            id = "#{id}-#{idCounts[id]}"
          else
            idCounts[id] = 1

          h.id = id

      stack = [{ level: 0, ul: tocRoot }]

      for h, i in headings
        level = parseInt h.tagName.substring 1
        li = document.createElement 'li'
        a = document.createElement 'a'
        a.href = "##{h.id}"
        a.textContent = h.textContent.trim()

        # Captura correta do h
        do (h) ->
          a.addEventListener 'click', (e) ->
            e.preventDefault()
            window.scrollTo
              top: h.getBoundingClientRect().top + window.scrollY - offset
              behavior: 'smooth'
            history.replaceState null, '', "##{h.id}"

        li.appendChild a

        while stack.length > 1 and level <= stack[stack.length - 1].level
          stack.pop()

        parent = stack[stack.length - 1].ul
        parent.appendChild li

        next = headings[i + 1]
        if next
          nextLevel = parseInt next.tagName.substring 1
          if nextLevel > level
            newUl = document.createElement 'ul'
            li.appendChild newUl
            stack.push { level, ul: newUl }

      links = tocRoot.querySelectorAll 'a'

      onScroll = ->
        fromTop = window.scrollY + offset + 1
        current = headings[0]

        for h in headings
          current = h if h.offsetTop <= fromTop

        for l in links
          l.classList.toggle 'active', l.getAttribute('href') is "##{current.id}"

      window.addEventListener 'scroll', onScroll, { passive: true }
      onScroll()

    for tocEl in document.querySelectorAll '.toc'
      # Obtém os textos dos botões do dataset (agora dinâmicos)
      btnShowText = tocEl.dataset.btnShow or 'Show'
      btnHiddenText = tocEl.dataset.btnHidden or 'Hide'

      buildTOC tocEl

      toggle = tocEl.querySelector '.toc-toggle'
      wrapper = tocEl.querySelector '.toc-list-wrapper'

      wrapper.style.display = 'none'
      toggle.setAttribute 'aria-expanded', 'false'
      toggle.textContent = btnShowText

      toggle.addEventListener 'click', ->
        expanded = toggle.getAttribute('aria-expanded') is 'true'
        wrapper.style.display = if expanded then 'none' else 'block'
        toggle.setAttribute 'aria-expanded', (!expanded).toString()
        # Define o texto dinamicamente
        toggle.textContent = if expanded then btnShowText else btnHiddenText

      tocTop = tocEl.offsetTop

      handleScrollFix = ->
        if window.innerWidth <= minLayoutWidth
          tocEl.classList.remove 'fixed'
          tocEl.style.position = ''
          tocEl.style.top = ''
          tocEl.style.zIndex = ''
          tocEl.style.width = ''
          return

        scrollTop = window.scrollY or document.documentElement.scrollTop

        if scrollTop >= tocTop
          tocEl.classList.add 'fixed'
          tocEl.style.position = 'fixed'
          tocEl.style.top = '0'
          tocEl.style.zIndex = '9999'
        else
          tocEl.classList.remove 'fixed'
          tocEl.style.position = ''
          tocEl.style.top = ''
          tocEl.style.width = ''

      # fechar TOC ao pressionar 'Esc'
      document.addEventListener 'keydown', (e) ->
        if e.key is 'Escape'
          wrapper.style.display = 'none'
          toggle.setAttribute 'aria-expanded', 'false'
          toggle.textContent = btnShowText

      window.addEventListener 'scroll', handleScrollFix, { passive: true }
      window.addEventListener 'resize', handleScrollFix
      handleScrollFix()

