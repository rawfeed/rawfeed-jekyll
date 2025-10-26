---
---

{%- include layout/data.liquid -%}

document.addEventListener "DOMContentLoaded", ->
  # discus
  # ------------------------------------------------------------------------------------------------
  discus = document.getElementById 'disqus_thread'

  if discus
    ###*
    * RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES
    ###
    disqus_shortname = '{{ blog_.post.comments.disqus.shortname }}'

    disqus_config = ->
      @page.url = '{{ page.url | absolute_url }}' # substitua pelo seu permalink completo
      @page.identifier = '{{ page.id }}' # ID unico para a discussão
      @page.disable_ads = true # desativa anuncios
      @page.recommendations = false # sesativa recomendações

    do ->
      d = document
      s = d.createElement 'script'

      s.src = '//' + disqus_shortname + '.disqus.com/embed.js'
      s.setAttribute 'data-timestamp', +new Date()

      (d.head or d.body).appendChild s
