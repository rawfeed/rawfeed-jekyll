/* TODO: Colocar cada script para página ideal, por exemplo:
  home: home.js [terminal]
  blog: blog.js
  tag: tag.js
  default.js será script que contem em todas páginas. [botão de top]
  post: post.js [toc]
  page: page.js
*/

document.addEventListener("DOMContentLoaded", () => {
  // O alvo do clique agora é o contêiner INTERATIVO
  const flipperAvatars = document.querySelectorAll('.avatar-flipper__open-true');
  const modalEl = document.getElementById('avatarModal');
  const modalAvatar = document.getElementById('modalAvatar');
  const header = document.querySelector('.header');
  const bsModal = new bootstrap.Modal(modalEl);

  flipperAvatars.forEach((flipper) => {
    // Escuta o clique no contêiner inteiro
    flipper.addEventListener("click", () => {
      // Encontra o card que realmente anima
      const card = flipper.querySelector('.avatar-card');
      // Encontra a imagem de TRÁS e pega o seu src ANTES da animação
      const backImage = flipper.querySelector('.avatar-back img');
      const backImageSrc = backImage.src;

      // Adiciona a classe de animação ao card
      card.classList.add("flip-avatar");

      card.addEventListener(
        "animationend",
        () => {
          card.classList.remove("flip-avatar");

          // Usa o src da imagem de trás que guardamos
          modalAvatar.src = backImageSrc;

          bsModal.show();
        },
        { once: true }
      );
    });
  });

  // quando o modal está visível, escondemos os contêineres (esta parte já estava correta)
  modalEl.addEventListener("shown.bs.modal", () => {
    modalAvatar.classList.remove("modal-avatar");
    void modalAvatar.offsetWidth;
    modalAvatar.classList.add("modal-avatar");
    header.classList.remove("modal-active");

    flipperAvatars.forEach((flipper) => flipper.classList.add("hidden"));
  });

  // quando o modal é fechado, mostramos os contêineres (esta parte já estava correta)
  modalEl.addEventListener("hidden.bs.modal", () => {
    flipperAvatars.forEach((flipper) => flipper.classList.remove("hidden"));
  });
});
