if (window.top !== window.self) {
  // Prevents the site from being displayed inside an <iframe>
  window.top.location = window.self.location;
}
