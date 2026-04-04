---
---

{%- include layout/data.liquid -%}


document.addEventListener("DOMContentLoaded", () => {
  const discus = document.getElementById('disqus_thread');

  if (discus) {
    /**
     * RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES
     */
    var disqus_shortname = '{{ blog_.post.comments.disqus.shortname }}';

    // The unique URL for the discussion, usually the post's permalink.
    var disqus_config = function () {
      this.page.url = '{{ page.url | absolute_url }}'; // Replace with your full permalink
      this.page.identifier = '{{ page.id }}'; // Unique ID for the discussion, use page.id or page.url
      this.page.disable_ads = true; // disabled ads
      this.page.recommendations = false; // disabled recommendations
    };

    (function() {
      var d = document, s = d.createElement('script');
      s.src = '//' + disqus_shortname + '.disqus.com/embed.js';
      s.setAttribute('data-timestamp', +new Date());
      (d.head || d.body).appendChild(s);
    })();
  }
});

