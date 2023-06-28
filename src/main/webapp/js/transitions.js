const faders = document.querySelectorAll(".eventImg");

const options = {
  root: null,
  treshold: 0,
  rootMargin: "-100px",
};

const observer = new IntersectionObserver(function (entries, observer) {
  entries.forEach((entry) => {
    if (!entry.isIntersecting) {
      return;
    } else {
      entry.target.classList.add("fade");
      console.log(entry);
      observer.unobserve(entry.target);
    }
  });
}, options);

faders.forEach((fader) => {
  observer.observe(fader);
});
