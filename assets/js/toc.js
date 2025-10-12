document.addEventListener("DOMContentLoaded", () => {
  /* TOC in top */
  const toc = document.getElementById('toc');

  const sentinel = document.createElement('div');
  toc.parentNode.insertBefore(sentinel, toc);

  const observer = new IntersectionObserver(
    ([entry]) => {
      if (!entry.isIntersecting) {
        toc.classList.add('toc-fixed');
      } else {
        toc.classList.remove('toc-fixed');
      }
    },
    { threshold: 0 }
  );

  observer.observe(sentinel);
});
