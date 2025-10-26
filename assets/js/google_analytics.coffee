---
---

{%- include layout/data.liquid -%}

is_dnt_active = window.doNotTrack is "1" or navigator.doNotTrack is "1" or navigator.doNotTrack is "yes" or navigator.msDoNotTrack is "1"

unless is_dnt_active
  gaLoader = (i,s,o,g,r,a,m) ->
    i[r] = i[r] or ->
      (i[r].q = i[r].q or []).push arguments
    i['GoogleAnalyticsObject'] = r
    i[r].l = 1 * new Date()
    a = s.createElement o
    m = s.getElementsByTagName(o)[0]
    a.async = 1
    a.src = g
    m.parentNode.insertBefore a, m

  gaLoader window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga'

  # envio dos comandos de rastreamento
  ga 'create', '{{ head_.google.analytics.id }}', 'auto'
  ga 'send', 'pageview'
