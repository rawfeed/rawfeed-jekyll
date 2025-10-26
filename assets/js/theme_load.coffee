---
---

do ->
  savedTheme = localStorage.getItem('theme') or 'light'
  document.documentElement.setAttribute 'data-theme', savedTheme
