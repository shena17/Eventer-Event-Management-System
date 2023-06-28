const show = document.querySelector(".open");
const close = document.querySelector(".close");

show.addEventListener("click", () => {
  const menu = document.querySelector(".menu");
  const visibility = menu.getAttribute("data-visible");

  if (visibility == "false") {
    menu.setAttribute("data-visible", true);
    show.setAttribute("aria-expanded", true);
    close.setAttribute("aria-expanded", true);
  }
});

close.addEventListener("click", () => {
  const menu = document.querySelector(".menu");
  const visibility = menu.getAttribute("data-visible");

  if (visibility == "true") {
    menu.setAttribute("data-visible", false);
    show.setAttribute("aria-expanded", false);
    close.setAttribute("aria-expanded", false);
  }
});
