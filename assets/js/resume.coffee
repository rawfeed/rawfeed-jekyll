---
---

# resume: button print
#-------------------------------------------------------------------------------------------------
btnPrint = document.getElementById "btn-print"
if btnPrint
  btnPrint.addEventListener "click", ->
    window.print()
