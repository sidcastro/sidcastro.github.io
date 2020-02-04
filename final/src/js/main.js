// wait for DOM to load before executing js
$(document).ready(function() {
  // on click, first remove any previously added "complete" class,
  // then add it to the clicked link
  $('#menu li a').on('click', function() {
    $('#menu li a').each(function(index) {
      $(this).removeClass('current');
    });
    $(this).addClass('current');
  });
});

function foo(obj) {
  alert(obj.tagName);
}​
