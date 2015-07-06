// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

function downvote(n) {
  var spots = document.getElementsByClassName("spot_number");
  var reviews = document.getElementsByClassName("review_number");
  var x = document.getElementsByClassName("votes");
  var votes = parseInt(x[n].innerHTML);
  x[n].innerHTML = (votes -= 1);
  $.ajax({
    type: 'PATCH',
    url:  "/spots/" + spots[n].innerHTML + "/reviews/" + reviews[n].innerHTML + "/downvote"
});
};

function upvote(n) {
  var spots = document.getElementsByClassName("spot_number");
  var reviews = document.getElementsByClassName("review_number");
  var x = document.getElementsByClassName("votes");
  var votes = x[n].innerHTML;
  var votes = (parseInt(votes));
  var votes = votes += 1
  x[n].innerHTML = votes;
  $.ajax({
    type: 'PATCH',
    url:  "/spots/" + spots[n].innerHTML + "/reviews/" + reviews[n].innerHTML + "/upvote"
});
};
