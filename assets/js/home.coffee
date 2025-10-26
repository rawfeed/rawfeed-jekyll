---
---

{%- include layout/data.liquid -%}

document.addEventListener "DOMContentLoaded", ->

  terminal = document.getElementById "terminal"

  if terminal

    # effects terminal: maximize
    # ----------------------------------------------------------------------------------------------
    btnMax = terminal.querySelector ".terminal-header__max"

    isFullscreen = false

    # maximize/restore
    btnMax.addEventListener "click", ->
      isFullscreen = not isFullscreen
      terminal.classList.toggle "terminal-fullscreen", isFullscreen

    # populate the terminal
    # ----------------------------------------------------------------------------------------------
    socialsEl = document.getElementById "terminal-screen--socials"
    screen = document.getElementById "screen"

    commands =
      # Multiple string is the same as using ` in Javascript
      help: """{{ home_.terminal.help.menu }}"""
      about: document.getElementById("home-content").innerHTML
      socials: if socialsEl then socialsEl.innerHTML else "{{ home_.terminal.no_socials }}"

    createInputLine = ->
      line = document.createElement "div"
      line.className = "line"

      prompt = document.createElement "span"
      prompt.className = "prompt"
      prompt.textContent = "[{{ home_.terminal.user }}@{{ home_.terminal.hostname }} ~]$"

      # wrapper para conter input, cursor e measure
      wrapper = document.createElement "span"
      wrapper.className = "input-wrapper"

      input = document.createElement "input"
      input.type = "text"
      input.className = "input"
      input.placeholder = "{{ home_.terminal.welcome }}"
      input.spellcheck = false
      input.autocomplete = "off"
      input.autocorrect = "off"
      input.autocapitalize = "off"

      cursor = document.createElement "span"
      cursor.className = "cursor"

      measure = document.createElement "span"
      measure.className = "measure"

      wrapper.appendChild input
      wrapper.appendChild cursor
      wrapper.appendChild measure

      line.appendChild prompt
      line.appendChild wrapper
      screen.appendChild line

      input.focus()
      screen.scrollTop = screen.scrollHeight

      # Updates the fake cursor position based on the input"s selectionStart
      updateCursor = ->
        sel = input.selectionStart or 0
        # measure the text to the position of the caret
        measure.textContent = input.value.slice 0, sel
        textWidth = measure.offsetWidth  # largura do texto sem scroll
        visibleLeft = textWidth - input.scrollLeft
        cursor.style.left = "#{visibleLeft}px"

        # ensure the caret is visible (for long texts): adjust input"s scrollLeft
        paddingRight = 10
        if textWidth - input.scrollLeft > input.clientWidth - paddingRight
          input.scrollLeft = textWidth - input.clientWidth + paddingRight
          cursor.style.left = "#{textWidth - input.scrollLeft}px"
        else if textWidth < input.scrollLeft
          input.scrollLeft = textWidth
          cursor.style.left = "#{textWidth - input.scrollLeft}px"

      # show/hide cursor animation as focus changes
      onFocus = ->
        cursor.style.opacity = "1"
        updateCursor()

      onBlur = ->
        cursor.style.opacity = "0"

      input.addEventListener "input", updateCursor

      input.addEventListener "keydown", (e) ->
        # Update position on keys that do not trigger input immediately (arrows, delete, etc.)
        setTimeout updateCursor, 0

        if e.key is "Enter"
          e.preventDefault()
          cmd = input.value.trim().toLowerCase()
          if cmd
            # remove input/cursor/measure and place fixed text
            wrapper.removeChild input
            wrapper.removeChild cursor
            wrapper.removeChild measure
            cmdText = document.createElement "span"
            cmdText.textContent = cmd
            wrapper.appendChild cmdText
            processCommand cmd
          else
            # if you enter without command, it just creates a new empty line (with prompt)
            wrapper.removeChild input
            wrapper.removeChild cursor
            wrapper.removeChild measure
            blank = document.createElement "span"
            blank.textContent = ""
            wrapper.appendChild blank

          # New line input
          createInputLine()

        else if e.key is "Escape"
          e.preventDefault()
          screen.innerHTML = ""
          createInputLine()

      # arrows, mouse click, mouseup (position caret), etc.
      input.addEventListener "keyup", updateCursor
      input.addEventListener "click", -> setTimeout updateCursor, 0
      input.addEventListener "mouseup", -> setTimeout updateCursor, 0
      input.addEventListener "focus", onFocus
      input.addEventListener "blur", onBlur

      updateCursor()

    dateShow = ->
      langBrowser = navigator.language or navigator.userLanguage

      options =
        weekday: 'long'
        year: 'numeric'
        month: 'long'
        day: 'numeric'
        hour: '2-digit'
        minute: '2-digit'

      brMessage = ""

      if langBrowser is "pt-BR"
        brMessage = " (Horário padrão de Brasília)"

      try
        new Date().toLocaleString(langBrowser, options) + brMessage
      catch e
        # Fallback for en-US
        new Date().toLocaleString('en-US', options) + brMessage

    # processes commands
    processCommand = (cmd) ->
      if cmd is "help"
        helpWriteHTML commands.help, mode = "html"
      else if cmd is "date"
        commandsPrint dateShow(), mode = "text"
      # else if cmd.startsWith("echo ")
      #   commandsPrint cmd.split(" ").slice(1).join(" ")
      else if cmd is "about"
        aboutWriteHTML commands.about
      else if cmd is "socials"
        socialsWriteHTML commands.socials
      else if cmd is "clear"
        screen.innerHTML = ""
      else if cmd
        commandsPrint cmd + "{{ home_.terminal.error }}", mode = "text"

    helpWriteHTML = (text, mode = "html") ->
      wrapper = document.createElement "div"
      wrapper.className = "line-wrapper"
      helpDescription = document.createElement "span"
      helpDescription.className = "help-description"
      helpDescription.innerHTML = "{{ home_.terminal.help.description | markdownify }}"
      helpCommandTitle = document.createElement "span"
      helpCommandTitle.className = "help-commands__title"
      helpCommandTitle.textContent = "{{ home_.terminal.help.commands.title }}"
      helpCommandDesc = document.createElement "span"
      helpCommandDesc.className = "help-commands__desc"
      helpCommandDesc.textContent = "{{ home_.terminal.help.commands.description }}"

      wrapper.appendChild helpDescription
      wrapper.appendChild helpCommandTitle
      wrapper.appendChild helpCommandDesc

      text.split("\n").forEach (t) ->
        line = document.createElement "div"
        line.className = "line"
        if mode is "html" then line.innerHTML = t else line.textContent = t
        wrapper.appendChild line

      screen.appendChild wrapper
      screen.scrollTop = screen.scrollHeight

    socialsWriteHTML = (content, mode = "html") ->
      wrapper = document.createElement "div"
      wrapper.className = "line-wrapper"
      socialsCommandDesc = document.createElement "span"
      socialsCommandDesc.className = "socials-command__desc"
      socialsCommandDesc.textContent = "{{ socials_.description.terminal.command.description }}"

      screen.appendChild socialsCommandDesc

      if mode is "html" then wrapper.innerHTML = content else wrapper.textContent = content

      screen.appendChild wrapper
      screen.scrollTop = screen.scrollHeight

    aboutWriteHTML = (content, mode = "html") ->
      wrapper = document.createElement "div"
      wrapper.className = "line-wrapper"
      if mode is "html" then wrapper.innerHTML = content else wrapper.textContent = content
      screen.appendChild wrapper
      screen.scrollTop = screen.scrollHeight

    commandsPrint = (text, mode = "html") ->
      # creates the wrapper to group all the lines
      wrapper = document.createElement "div"
      wrapper.className = "line-wrapper"

      text.split("\n").forEach (t) ->
        line = document.createElement "div"
        line.className = "line"
        if mode is "html" then line.innerHTML = t else line.textContent = t
        wrapper.appendChild line

      screen.appendChild wrapper
      screen.scrollTop = screen.scrollHeight

    # start terminal
    createInputLine()

    # when clicking on the terminal, it always focuses on the last existing input
    terminal.addEventListener "click", (e) ->
      # avoids focusing when clicking a header button, etc.
      lastInput = screen.querySelector ".input:last-of-type"
      lastInput.focus() if lastInput

