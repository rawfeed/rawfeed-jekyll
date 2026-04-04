document.addEventListener("DOMContentLoaded", () => {

  /* resume: button print
  # -------------------------------------------------------------------------------------------------
  */
  const btnPrint = document.getElementById("btn-print");

  if (btnPrint) {
    btnPrint.addEventListener("click", () => {
      window.print();
    });
  }
});
