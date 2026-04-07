---
---

{%- include assigned -%}

document.addEventListener("DOMContentLoaded", () => {
  const btn = document.getElementById('blog-search__btn');
  const box = document.querySelector('.blog-search');
  const searchInput = document.getElementById('blog-search__input');
  const blogPosts = document.getElementById('posts');
  const searchResults = document.getElementById('blog-search__results');
  const searchResultsWrap = document.getElementById('blog-search__results-wrap');
  const btnSearchClean = document.getElementById('blog-search__btn-clean');
  const blogSearchInput = document.getElementById('blog-search__input');


  if (!btn || !box) return;

  const openSearch = () => {
    box.classList.add('is-open');
    box.removeAttribute('inert');
    box.style.maxHeight = box.scrollHeight + 'px';
    box.style.opacity = '1';
    box.addEventListener('transitionend', function onOpened(e) {
      if (e.propertyName === 'max-height') {
        box.style.maxHeight = 'none';
        box.removeEventListener('transitionend', onOpened);
      }
    });
    blogSearchInput.focus();
  };

  const closeSearch = () => {
    box.style.maxHeight = box.scrollHeight + 'px';
    void box.offsetHeight; // reflow force
    requestAnimationFrame(() => {
      box.style.maxHeight = '0';
      box.style.opacity = '0';
    });
    box.setAttribute('inert', '');
    box.classList.remove('is-open');
  };

  btn.addEventListener('click', (e) => {
    e.preventDefault();

    // if are already in /blog/, toggle
    const pathname = location.pathname.replace(/\/$/, '');
    const isBlog = pathname === '/blog' || pathname === '/blog/index.html';

    if (!isBlog) {
      // if are on another page, go to /blog/ and open it
      window.location.href = "{{ search_url }}";
      return;
    }

    // toggle
    if (box.classList.contains('is-open')) {
      closeSearch();
      searchInput.value = '';
      blogPosts.classList.remove('disabled');
      searchResultsWrap.classList.add('disabled');
    } else {
      openSearch();
    }
  });

  // opens automatically if arrived from another link with ?search=open
  const params = new URLSearchParams(location.search);
  if (params.get('search') === 'open') {
    setTimeout(openSearch, 30);
  }

  /* clean button input blog search
  --------------------------------------------------------------------------------------------------
  */
  function clearSearch() {
    blogSearchInput.value = '';
    blogPosts.classList.remove('disabled');
    searchResults.classList.add('disabled');
    searchResultsWrap.classList.add('disabled');
    blogSearchInput.focus();
  }
  btnSearchClean.addEventListener('click', clearSearch);
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
      clearSearch();
      closeSearch();
    }
  });

  /* open results and close posts in search (toggle)
  --------------------------------------------------------------------------------------------------
  */
  /* Fuse.js search implementation
  --------------------------------------------------------------------------------------------------
  */
  let fuse;
  const searchJsonUrl = "{{ '/assets/json/blog_search.json' | relative_url }}";

  fetch(searchJsonUrl)
    .then(response => response.json())
    .then(data => {
      fuse = new Fuse(data, {
        keys: ['title', 'tags'],
        threshold: 0.3,
        includeMatches: true
      });
    })
    .catch(error => {
      console.error('Error fetching search data:', error);
    });

  function renderResults(results) {
    if (results.length === 0) {
      searchResults.innerHTML = '<p>{{ blog.no_results | default: "No results found" }}</p>';
      return;
    }

    const html = results.map(result => {
      const item = result.item;
      // Using existing template logic
      return `<li><span class="blog-list__meta"><time datetime="${item.date}">${item.date}</time></span>&nbsp;»&nbsp; <a class="blog-list__link" href="{{ site.url }}${item.url}">${item.title}</a></li>`;
    }).join('');

    searchResults.innerHTML = html;
  }

  searchInput.addEventListener('input', () => {
    const query = searchInput.value.trim();
    if (query.length > 0) {
      blogPosts.classList.add('disabled');
      searchResults.classList.remove('disabled');
      searchResultsWrap.classList.remove('disabled');

      if (fuse) {
        const results = fuse.search(query);
        renderResults(results);
      }
    } else {
      blogPosts.classList.remove('disabled');
      searchResults.classList.add('disabled');
      searchResultsWrap.classList.add('disabled');
      searchResults.innerHTML = '';
    }
  });
});
