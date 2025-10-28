---
---

{%- include layout/data.liquid -%}

document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("contactForm");
  if (form) {
    const submitButton = document.getElementById("submitButton");
    const endpoint = "{{ head_.google.apps_script.url }}"; // URL Google Apps Script

    // get modal
    function showModal(title, message, type = 'success') {
      const modalEl = document.getElementById('contactMessageModal');
      const modalTitle = modalEl.querySelector('.modal-title');
      const modalBody = modalEl.querySelector('.modal-body');
      const modalContent = modalEl.querySelector('.modal-content');

      modalContent.classList.remove('contact-message-success', 'contact-message-error', 'contact-message-warning');


      // Apply the color according to the type
      if (type === 'success') {
        modalContent.classList.add('contact-message-success');
      } else if (type === 'error') {
        modalContent.classList.add('contact-message-error');
      } else if (type === 'warning') {
        modalContent.classList.add('contact-message-warning');
      }

      modalTitle.innerHTML = title;
      modalBody.innerHTML = message;

      const bsModal = new bootstrap.Modal(modalEl);
      bsModal.show();
    }

    form.addEventListener("submit", async (e) => {
      e.preventDefault();

      const recaptchaResponse = grecaptcha.getResponse();
      if (!recaptchaResponse) {
        showModal(
          "{{ contact_.recaptcha.warning.title | default: 'Warning' }}",
          `{{ contact_.recaptcha.warning.content | default: "Please tick the 'I'm not a robot' box." }}`,
          "warning"
        );
        return;
      }

      const textarea = document.getElementById('textMessage');
      const text = textarea.value.trim();
      if (text.length < "{{ contact_.message.caracters.min }}" ) {
        showModal(
          "{{ contact_.message.caracters.warning.title | default: 'Warning' }}",
          "{{ contact_.message.caracters.warning.content | default: 'The message must have at least 50 characters.' }}",
          "warning"
        );
        return;
      }

      submitButton.disabled = true;
      submitButton.textContent = "{{ contact_.message.status | default: 'Sending...Wait' }}";

      const formData = new FormData(form);
      const data = Object.fromEntries(formData.entries());

      try {
        const response = await fetch(endpoint, {
          method: "POST",
          redirect: "follow",
          body: JSON.stringify(data)
        });

        const result = await response.json();

        if (result.result === 'success') {
          form.reset();
          grecaptcha.reset();
          showModal(
            "{{ contact_.message.success.title | default: 'Message Sent' }}",
            "{{ contact_.message.success.content | default: 'Your message has been sent successfully!' }}",
            "success"
          );
        } else {
          showModal(
            "{{ contact_.message.error.title | default: 'Error' }}",
            "{{ contact_.message.error.content | default: 'Something went wrong while sending your message.' }}",
            "error"
          );
          throw new Error(result.message || "{{ contact_.message.error.content | default: 'An unknown error has occurred.' }}");
        }

      } catch (error) {
        console.error("Error sending:", error);
        if (error.message.includes("reCAPTCHA")) {
            showModal(
              "{{ contact_.message.error.title | default: 'Error' }}",
              "{{ contact_.recaptcha.fail | default: 'Verification failed. Please reload the page and try again.' }}",
              "error"
            );
        } else {
            showModal(
              "{{ contact_.message.error.title | default: 'Error' }}",
              "{{ contact_.recaptcha.error | default: 'An error occurred while sending the message. Please try again.' }}",
              "error"
            );
        }
        grecaptcha.reset();

      } finally {
        submitButton.disabled = false;
        submitButton.textContent = "{{ contact_.button.text | default: 'Send!' }}";
      }
    });
  }
});
