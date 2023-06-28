const intro = document.getElementById("navbar");
const menu = document.querySelector(".menu");
const open = document.querySelector(".open");
const close = document.querySelector(".close");
const navbar = document.querySelector(".navbar");

window.onscroll = function () {
  if (window.pageYOffset > intro.offsetTop) {
    menu.setAttribute("data-visible", false);
    show.setAttribute("aria-expanded", false);
    close.setAttribute("aria-expanded", false);
    navbar.classList.add("sticky");
  } else {
    navbar.classList.remove("sticky");
  }
};
