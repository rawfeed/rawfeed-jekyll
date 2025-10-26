---
---

{%- include layout/data.liquid -%}

# Script that will be used throughout the site

document.addEventListener "DOMContentLoaded", ->
  # lock menu context (click right mouse)
  # ------------------------------------------------------------------------------------------------

  document.addEventListener 'contextmenu', (e) -> e.preventDefault()

  # avatar
  #-------------------------------------------------------------------------------------------------
  do ->
    flipperAvatars = document.querySelectorAll('.avatar-flipper__open-true')
    modalEl = document.getElementById('avatarModal')
    modalAvatar = document.getElementById('modalAvatar')
    header = document.querySelector('.header')
    bsModal = new bootstrap.Modal(modalEl)

    for flipper in flipperAvatars
      do (flipper) -> # the 'do' creates a new scope and passes the 'flipper' as an argument
        flipper.addEventListener "click", ->
          # NOW, 'flipper' refers to the correct avatar as it was isolated by IIFE
          card = flipper.querySelector('.avatar-card')
          backImage = flipper.querySelector('.avatar-back img')
          backImageSrc = backImage.src

          card.classList.add "flip-avatar"

          card.addEventListener "animationend", (event) ->
            card.classList.remove "flip-avatar"
            modalAvatar.src = backImageSrc
            bsModal.show()
          , { once: true }

    modalEl.addEventListener "shown.bs.modal", ->
      modalAvatar.classList.remove "modal-avatar"
      modalAvatar.offsetWidth
      modalAvatar.classList.add "modal-avatar"
      header.classList.remove "modal-active"

      for f in flipperAvatars
        f.classList.add "hidden"

    modalEl.addEventListener "hidden.bs.modal", ->
      for f in flipperAvatars
        f.classList.remove "hidden"

  # change theme light/dark
  # ------------------------------------------------------------------------------------------------
  #
  toggleButton = document.getElementById 'toggle-theme'
  iconToggleButton = toggleButton.querySelector 'i'
  root = document.documentElement

  setTheme = (theme) ->
    root.setAttribute 'data-theme', theme

    iconToggleButton.classList.remove 'fa-sun', 'fa-moon'
    iconToggleButton.classList.add if theme is 'dark' then 'fa-sun' else 'fa-moon'

    if typeof setGiscusTheme is 'function'
      setGiscusTheme theme

    localStorage.setItem 'theme', theme

  # boot with saved or light
  setTheme localStorage.getItem('theme') or 'light'

  # change theme on click
  toggleButton.addEventListener 'click', ->
    current = root.getAttribute 'data-theme'
    next = if current is 'light' then 'dark' else 'light'
    setTheme next

  # Show/disappear top button
  # ------------------------------------------------------------------------------------------------

  topButton = document.getElementById "top-link"
  scrollThreshold = 700
  window.onscroll = -> scrollFunction()

  scrollFunction = ->
    if document.body.scrollTop > scrollThreshold or document.documentElement.scrollTop > scrollThreshold
      topButton.style.display = "block"
    else
      topButton.style.display = "none"

  topButton.addEventListener "click", -> topFunction()

  topFunction = ->
    window.scrollTo
      top: 0
      behavior: 'smooth'

  # function Giscus
  # ------------------------------------------------------------------------------------------------
  #
  setGiscusTheme = (theme) ->
    # The function only executes if the themes object exists
    if window.giscusThemes
      giscusTheme = if theme is 'light' then window.giscusThemes.light else window.giscusThemes.dark

      message =
        giscus:
          setConfig:
            theme: giscusTheme

      # Let's use a timeout to ensure the Giscus iframe is ready
      giscusInterval = setInterval ->
        giscusFrame = document.querySelector 'iframe.giscus-frame'
        # Se o iframe existir no documento...
        if giscusFrame
          # ...we sent the message...
          giscusFrame.contentWindow.postMessage message, 'https://giscus.app'
          # ...and we stopped trying.
          clearInterval giscusInterval
      , 500

      # As an extra safeguard, we stop trying after a few seconds
      # to avoid creating an infinite loop if something goes wrong.
      setTimeout ->
        clearInterval giscusInterval
      , 4000  # Stop trying after 4 seconds

  # giscus theme
  #-------------------------------------------------------------------------------------------------
  giscus = document.getElementById "giscus"
  if giscus
    window.giscusThemes
      light: "{{ blog_.post.comments.giscus.theme_light | default: 'light' }}"
      dark: "{{ blog_.post.comments.giscus.theme_dark | default: 'dark' }}"


  # highlight code
  #-------------------------------------------------------------------------------------------------
  document.querySelectorAll("div.highlight, figure.highlight").forEach (highlightBlock) ->
    container = document.createElement "div"
    container.className = "code-block-container"
    header = document.createElement "div"
    header.className = "code-block-header"

    # button copy
    button = document.createElement "button"
    button.className = "copy-btn"
    button.type = "button"
    button.setAttribute "aria-label", "Copy code"

    icon = document.createElement "i"
    icon.className = "fa-solid fa-clipboard"
    button.appendChild icon

    header.appendChild button

    highlightBlock.parentNode.insertBefore container, highlightBlock
    container.appendChild header
    container.appendChild highlightBlock

    # event copy
    button.addEventListener "click", ->
      codeElement = highlightBlock.querySelector "td.code"
      textToCopy = if codeElement then codeElement.innerText.trim() else highlightBlock.innerText.trim()

      navigator.clipboard.writeText(textToCopy).then ->
        icon.className = "fa-solid fa-check"
        setTimeout (-> icon.className = "fa-solid fa-clipboard"), 2000
      , ->
        icon.className = "fa-solid fa-xmark"
        setTimeout (-> icon.className = "fa-solid fa-clipboard"), 2000
