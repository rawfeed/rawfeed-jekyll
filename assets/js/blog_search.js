document.addEventListener("DOMContentLoaded", () => {
  /* blog search open
  --------------------------------------------------------------------------------------------------
  */
  const btn = document.getElementById('blog-search__btn');
  const box = document.querySelector('.blog-search');
  const searchInput = document.getElementById('blog-search__input');
  const blogPosts = document.getElementById('posts');
  const searchResults = document.getElementById('blog-search__results');
  const searchResultsWrapper = document.getElementById('blog-search__results-wrapper');
  const btnSearchClean = document.getElementById('blog-search__btn-clean');
  const blogSeachInput = document.getElementById('blog-search__input');


  if (!btn || !box) return;

  const openSearch = () => {
    box.classList.add('is-open');
    box.style.maxHeight = box.scrollHeight + 'px';
    box.style.opacity = '1';
    box.addEventListener('transitionend', function onOpened(e) {
      if (e.propertyName === 'max-height') {
        box.style.maxHeight = 'none';
        box.removeEventListener('transitionend', onOpened);
      }
    });
    blogSeachInput.focus();
  };

  const closeSearch = () => {
    box.style.maxHeight = box.scrollHeight + 'px';
    void box.offsetHeight; // reflow force
    requestAnimationFrame(() => {
      box.style.maxHeight = '0';
      box.style.opacity = '0';
    });
    box.classList.remove('is-open');
  };

  btn.addEventListener('click', (e) => {
    e.preventDefault();
    // if are already in /blog/, toggle
    const pathname = location.pathname.replace(/\/$/, '');
    const isBlog = pathname === '/blog' || pathname === '/blog/index.html';

    if (!isBlog) {
      // if are on another page, go to /blog/ and open it
      window.location.href = '/blog/?search=open';
      return;
    }

    // toggle
    if (box.classList.contains('is-open')) {
      closeSearch();
      searchInput.value = '';
      blogPosts.classList.remove('disabled');
      searchResultsWrapper.classList.add('disabled');
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
    blogSeachInput.value = '';
    blogPosts.classList.remove('disabled');
    searchResults.classList.add('disabled');
    searchResultsWrapper.classList.add('disabled');
    blogSeachInput.focus();
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
  searchInput.addEventListener('input', () => {
    if (searchInput.value.trim().length > 0) {
      blogPosts.classList.add('disabled');
      searchResults.classList.remove('disabled');
      searchResultsWrapper.classList.remove('disabled');
    } else {
      blogPosts.classList.remove('disabled');
      searchResults.classList.add('disabled');
      searchResultsWrapper.classList.add('disabled');
    }
  });

});
