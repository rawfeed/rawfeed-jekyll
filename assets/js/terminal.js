document.addEventListener("DOMContentLoaded", () => {
  /* effects terminal: maximize
  --------------------------------------------------------------------------------------------------
  */
  const terminal = document.getElementById("terminal");

  if (!terminal) return;

  const btnMax = terminal.querySelector(".terminal-header__max");

  let isFullscreen = false;

  // maximize/restore
  btnMax.addEventListener("click", () => {
    isFullscreen = !isFullscreen;
    terminal.classList.toggle("terminal-fullscreen", isFullscreen);
  });
});
