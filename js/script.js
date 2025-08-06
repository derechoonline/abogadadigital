document.addEventListener("DOMContentLoaded", function() {
  const section = document.querySelector(".seccion-quien-soy");

  function checkScroll() {
    const rect = section.getBoundingClientRect();
    if (rect.top < window.innerHeight - 100) {
      section.classList.add("show");
      window.removeEventListener("scroll", checkScroll);
    }
  }

  window.addEventListener("scroll", checkScroll);
  checkScroll();
});
