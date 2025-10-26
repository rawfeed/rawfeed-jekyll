---
---

{%- include layout/data.liquid -%}

document.addEventListener "DOMContentLoaded", ->

  contact = document.getElementById "contact"

  if contact
    form = document.getElementById "contactForm"
    submitButton = document.getElementById "submitButton"
    endpoint = "{{ head_.google.apps_script.url }}"  # URL Google Apps Script

    # função para exibir modal
    showModal = (title, message, type = 'success') ->
      modalEl = document.getElementById 'contactMessageModal'
      modalTitle = modalEl.querySelector '.modal-title'
      modalBody = modalEl.querySelector '.modal-body'
      modalContent = modalEl.querySelector '.modal-content'

      modalContent.classList.remove 'contact-message-success', 'contact-message-error', 'contact-message-warning'

      # Aplica a cor de acordo com o tipo
      if type is 'success'
        modalContent.classList.add 'contact-message-success'
      else if type is 'error'
        modalContent.classList.add 'contact-message-error'
      else if type is 'warning'
        modalContent.classList.add 'contact-message-warning'

      modalTitle.innerHTML = title
      modalBody.innerHTML = message

      bsModal = new bootstrap.Modal modalEl
      bsModal.show()

    form.addEventListener "submit", (e) ->
      e.preventDefault()

      recaptchaResponse = grecaptcha.getResponse()
      unless recaptchaResponse
        showModal(
          """{{ contact_.recaptcha.warning.title | default: "Warning" }}""",
          """{{ contact_.recaptcha.warning.content | default: "Please tick the 'I'm not a robot' box." }}""",
          "warning"
        )
        return

      textarea = document.getElementById 'textMessage'
      text = textarea.value.trim()
      if text.length < "{{ contact_.message.caracters.min }}"
        showModal(
          """{{ contact_.message.caracters.warning.title | default: "Warning" }}""",
          """{{ contact_.message.caracters.warning.content | default: "The message must have at least 50 characters." }}""",
          "warning"
        )
        return

      submitButton.disabled = true
      submitButton.textContent = """{{ contact_.message.status | default: "Sending...Wait" }}"""

      formData = new FormData form
      data = Object.fromEntries formData.entries()

      fetch(endpoint,
        method: "POST"
        redirect: "follow"
        body: JSON.stringify data
      ).then (response) ->
        response.json()
      .then (result) ->
        if result.result is 'success'
          form.reset()
          grecaptcha.reset()
          showModal(
            """{{ contact_.message.success.title | default: "Message Sent" }}""",
            """{{ contact_.message.success.content | default: "Your message has been sent successfully!" }}""",
            "success"
          )
        else
          showModal(
            """{{ contact_.message.error.title | default: "Error" }}""",
            """{{ contact_.message.error.content | default: "Something went wrong while sending your message." }}""",
            "error"
          )
          throw new Error result.message or "{{ contact_.message.error.content | default: 'An unknown error has occurred.' }}"
      .catch (error) ->
        console.error "Error sending:", error
        if error.message.includes "reCAPTCHA"
          showModal(
            """{{ contact_.message.error.title | default: "Error" }}""",
            """{{ contact_.recaptcha.fail | default: "Verification failed. Please reload the page and try again." }}""",
            "error"
          )
        else
          showModal(
            """{{ contact_.message.error.title | default: "Error" }}""",
            """{{ contact_.recaptcha.error | default: "An error occurred while sending the message. Please try again." }}""",
            "error"
          )
        grecaptcha.reset()
      .finally ->
        submitButton.disabled = false
        submitButton.textContent = """{{ contact_.button.text | default: "Send!" }}"""
