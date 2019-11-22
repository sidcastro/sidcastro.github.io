$(document).foundation()

function myFunction() {
  var elements = ["location-1", "location-2", "location-3", "location-4", "location-5"];

  for(i = 0; i < elements.length; i++) {
    var x = document.getElementById(elements[i]);
    if (x.style.display === "none") {
      x.style.display = "block";
    } else {
      x.style.display = "none";
    }
  }
}
