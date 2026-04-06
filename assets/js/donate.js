---
---

{%- include layout/data.liquid -%}


document.addEventListener("DOMContentLoaded", () => {
  const donation = document.getElementById("donation");
  if (!donation) return;

  document.querySelectorAll(".donation__btn--copy").forEach(btn => {
    btn.addEventListener("click", function () {
      navigator.clipboard.writeText(this.dataset.copy).then(() => {
        this.innerText = "{{ donate.copy_button.clicked }}";
        setTimeout(() => this.innerText = "{{ donate.copy_button.text }}", 2000);
      });
    });
  });

  // QR MODAL
  const qrModal = document.getElementById('qrModal');
  const qrModalImg = document.getElementById('qrModalImg');

  document.querySelectorAll(".clickable-qr").forEach(img => {
    img.addEventListener("click", function () {
      qrModalImg.src = this.dataset.qr;
    });
  });

});
