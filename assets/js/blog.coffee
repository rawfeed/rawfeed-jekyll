---
---

{%- include layout/data.liquid -%}

document.addEventListener "DOMContentLoaded", ->

  blog = document.getElementById "blog"

  if blog
    btn = document.getElementById 'blog-search__btn'
    box = document.querySelector '.blog-search'
    searchInput = document.getElementById 'blog-search__input'
    blogPosts = document.getElementById 'posts'
    searchResults = document.getElementById 'blog-search__results'
    searchResultsWrapper = document.getElementById 'blog-search__results-wrapper'
    btnSearchClean = document.getElementById 'blog-search__btn-clean'
    blogSeachInput = document.getElementById 'blog-search__input'

    openSearch = ->
      box.classList.add 'is-open'
      box.removeAttribute 'inert'
      box.style.maxHeight = "#{box.scrollHeight}px"
      box.style.opacity = '1'
      box.addEventListener 'transitionend', onOpened = (e) ->
        if e.propertyName is 'max-height'
          box.style.maxHeight = 'none'
          box.removeEventListener 'transitionend', onOpened
      blogSeachInput.focus()

    closeSearch = ->
      box.style.maxHeight = "#{box.scrollHeight}px"
      _ = box.offsetHeight  # reflow force
      requestAnimationFrame ->
        box.style.maxHeight = '0'
        box.style.opacity = '0'
      box.setAttribute 'inert', ''
      box.classList.remove 'is-open'

    btn.addEventListener 'click', (e) ->
      e.preventDefault()

      # if are already in /blog/, toggle
      pathname = location.pathname.replace /\/$/, ''
      isBlog = pathname is '/blog' or pathname is '/blog/index.html'

      unless isBlog
        # if are on another page, go to /blog/ and open it
        window.location.href = "{{ search_url }}"
        return

      # toggle
      if box.classList.contains 'is-open'
        closeSearch()
        searchInput.value = ''
        blogPosts.classList.remove 'disabled'
        searchResultsWrapper.classList.add 'disabled'
      else
        openSearch()

    # opens automatically if arrived from another link with ?search=open
    params = new URLSearchParams location.search
    if params.get('search') is 'open'
      setTimeout openSearch, 30

    # clean button input blog search
    # ----------------------------------------------------------------------------------------------

    clearSearch = ->
      blogSeachInput.value = ''
      blogPosts.classList.remove 'disabled'
      searchResults.classList.add 'disabled'
      searchResultsWrapper.classList.add 'disabled'
      blogSeachInput.focus()

    btnSearchClean.addEventListener 'click', clearSearch

    document.addEventListener 'keydown', (e) ->
      if e.key is 'Escape'
        clearSearch()
        closeSearch()

    # open results and close posts in search (toggle)
    # ----------------------------------------------------------------------------------------------

    searchInput.addEventListener 'input', ->
      if searchInput.value.trim().length > 0
        blogPosts.classList.add 'disabled'
        searchResults.classList.remove 'disabled'
        searchResultsWrapper.classList.remove 'disabled'
      else
        blogPosts.classList.remove 'disabled'
        searchResults.classList.add 'disabled'
        searchResultsWrapper.classList.add 'disabled'

    sjs = SimpleJekyllSearch
      searchInput: document.getElementById 'blog-search__input'
      resultsContainer: document.getElementById 'blog-search__results'
      searchResultTemplate: '<li><span class="blog-list__meta"><time datetime="{date}">{date}</time></span>&nbsp;»&nbsp; <a class="blog-list__link" href="{{ site.url }}{url}">{title}</a></li>'
      noResultsText: '<p>{{ blog_.no_results | default: "No results found" }}</p>'
      json: "{{ '/assets/json/blog_search.json' | relative_url }}"

