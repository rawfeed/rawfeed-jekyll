---
---

document.addEventListener("DOMContentLoaded", () => {
  /* lock menu context (click right mouse)
  --------------------------------------------------------------------------------------------------
  */
  document.addEventListener('contextmenu', e => e.preventDefault());

  /* avatar
  -------------------------------------------------------------------------------------------------
  */
  const modalEl = document.getElementById('avatarModal');
  if (modalEl) {
    const flipperAvatars = document.querySelectorAll('.avatar-flipper__open-true');
    const modalAvatar = document.getElementById('modalAvatar');
    const header = document.querySelector('.header');
    const bsModal = new bootstrap.Modal(modalEl);

    flipperAvatars.forEach((flipper) => {
      flipper.addEventListener("click", () => {
        const card = flipper.querySelector('.avatar-card');
        const backImage = flipper.querySelector('.avatar-back img');
        const backImageSrc = backImage.src;

        card.classList.add("flip-avatar");

        card.addEventListener(
          "animationend",
          () => {
            card.classList.remove("flip-avatar");

            modalAvatar.src = backImageSrc;

            bsModal.show();
          },
          { once: true }
        );
      });
    });

    modalEl.addEventListener("shown.bs.modal", () => {
      modalAvatar.classList.remove("modal-avatar");
      void modalAvatar.offsetWidth;
      modalAvatar.classList.add("modal-avatar");
      header.classList.remove("modal-active");

      flipperAvatars.forEach((flipper) => flipper.classList.add("hidden"));
    });

    modalEl.addEventListener("hidden.bs.modal", () => {
      flipperAvatars.forEach((flipper) => flipper.classList.remove("hidden"));
    });
  }


  /* Show/disappear top button
  --------------------------------------------------------------------------------------------------
  */
  let topButton = document.getElementById("top-link");
  const scrollThreshold = 700;
  window.onscroll = function () { scrollFunction() };

  function scrollFunction() {
    if (document.body.scrollTop > scrollThreshold || document.documentElement.scrollTop > scrollThreshold) {
      topButton.style.display = "block";
    } else {
      topButton.style.display = "none";
    }
  }

  topButton.addEventListener("click", topFunction);

  function topFunction() {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  }

  /* function Giscus
  --------------------------------------------------------------------------------------------------
  */
  function setGiscusTheme(theme) {
    // The function only executes if the themes object exists
    if (window.giscusThemes) {
      const giscusTheme = theme === 'light'
        ? window.giscusThemes.light
        : window.giscusThemes.dark;

      const message = {
        giscus: {
          setConfig: {
            theme: giscusTheme
          }
        }
      };

      // Let's use a timeout to ensure the Giscus iframe is ready
      const giscusInterval = setInterval(() => {
        const giscusFrame = document.querySelector('iframe.giscus-frame');
        // Se o iframe existir no documento...
        if (giscusFrame) {
          // ...we sent the message...
          giscusFrame.contentWindow.postMessage(message, 'https://giscus.app');
          // ...and we stopped trying.
          clearInterval(giscusInterval);
        }
      }, 500);

      // As an extra safeguard, we stop trying after a few seconds
      // to avoid creating an infinite loop if something goes wrong.
      setTimeout(() => {
        clearInterval(giscusInterval);
      }, 4000); // Stop trying after 4 seconds
    }
  }

  /* change theme light/dark
  --------------------------------------------------------------------------------------------------
  */
  const toggleButton = document.getElementById('toggle-theme');
  const icon = toggleButton.querySelector('i');
  // const avatar = document.getElementById('avatarImage');
  const root = document.documentElement;

  function setTheme(theme) {
    root.setAttribute('data-theme', theme);

    icon.classList.remove('fa-sun', 'fa-moon');
    icon.classList.add(theme === 'dark' ? 'fa-sun' : 'fa-moon');

    if (typeof setGiscusTheme === 'function') {
      setGiscusTheme(theme);
    }

    // if (avatar) {
    //   avatar.src = theme === 'light'
    //     ? avatar.dataset.light
    //     : avatar.dataset.dark;
    // }

    localStorage.setItem('theme', theme);

  }

  // boot with saved or light
  setTheme(localStorage.getItem('theme') || 'light');

  // change theme on click
  toggleButton.addEventListener('click', () => {
    const current = root.getAttribute('data-theme');
    const next = current === 'light' ? 'dark' : 'light';
    setTheme(next);
  });


  /* highlight code
  --------------------------------------------------------------------------------------------------
  */
  document.querySelectorAll("div.highlight, figure.highlight").forEach(highlightBlock => {
    const container = document.createElement("div");
    container.className = "code-block-container";
    const header = document.createElement("div");
    header.className = "code-block-header";

    // button copy
    const button = document.createElement("button");
    button.className = "copy-btn";
    button.type = "button";
    button.setAttribute("aria-label", "Copy code");

    const icon = document.createElement("i");
    icon.className = "fa-solid fa-clipboard";
    button.appendChild(icon);

    header.appendChild(button);

    highlightBlock.parentNode.insertBefore(container, highlightBlock);
    container.appendChild(header);
    container.appendChild(highlightBlock);

    // event copy
    button.addEventListener("click", () => {
      const codeElement = highlightBlock.querySelector("td.code");
      const textToCopy = codeElement ? codeElement.innerText.trim() : highlightBlock.innerText.trim();

      navigator.clipboard.writeText(textToCopy).then(() => {
        icon.className = "fa-solid fa-check";
        setTimeout(() => (icon.className = "fa-solid fa-clipboard"), 2000);
      }, () => {
        icon.className = "fa-solid fa-xmark";
        setTimeout(() => (icon.className = "fa-solid fa-clipboard"), 2000);
      });
    });
  });

});
