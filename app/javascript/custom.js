document.addEventListener("DOMContentLoaded", function () {
  setInterval(function () {
    const alertBox = document.querySelector("#alert-box");
    if (alertBox) {
      setTimeout(function () {
        alertBox.style.display = "none";
      }, 3000);
    }
  }, 1000);
});