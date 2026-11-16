---
---

{%- include assigned -%}

document.addEventListener("DOMContentLoaded", () => {
  const donation = document.getElementById("donation");
  if (! donation) return;


  document.querySelectorAll(".donation__btn--copy").forEach(btn => {
    btn.addEventListener("click", function() {
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
    img.addEventListener("click", function() {
      if (qrModalImg) {
        qrModalImg.src = this.dataset.qr;
        qrModal.showModal();
      }
    });
  });
});

document.addEventListener('click', e => {const d=document.getElementById('qrModal');if(d && e.target===d){const r=d.getBoundingClientRect();if(e.clientX<r.left||e.clientX>r.right||e.clientY<r.top||e.clientY>r.bottom)d.close();}});
