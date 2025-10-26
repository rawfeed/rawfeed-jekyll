---
---

# Checks if the page is inside an iframe (i.e., if the top of the window
# is not the window itself)
if window.top isnt window.self
  # Prevents the site from being displayed inside an <iframe>.
  # Forces the top frame to navigate to the current URL.
  window.top.location = window.self.location
