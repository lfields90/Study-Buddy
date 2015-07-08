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
  var revoke = document.getElementsByClassName("revoke");
  var upvote = document.getElementsByClassName("upvote");
  var downvote = document.getElementsByClassName("downvote");
  var spots = document.getElementsByClassName("spot_number");
  var reviews = document.getElementsByClassName("review_number");
  var vote = document.getElementsByClassName("votes");
  var votes = parseInt(vote[n].innerHTML);
  vote[n].innerHTML = (votes -= 1);
  $.ajax({
    type: 'PATCH',
    url:  "/spots/" + spots[n].innerHTML + "/reviews/" + reviews[n].innerHTML + "/downvote"
  });
  var data = {
    "user_id": parseInt(document.getElementById("user_number").innerHTML),
    "review_id": parseInt(reviews[n].innerHTML),
    "spot_id": parseInt(spots[n].innerHTML),
    "vote_value": -1
  };
  $.ajax({
    type: 'POST',
    url:  "/votes",
    contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(data),
        success: function(response) {
            console.log(response);
        },
        error: function(response) {
            console.log(response);
        }
  });
  revoke[n].style.display = "inline-block";
  upvote[n].style.display = "none";
  downvote[n].style.display = "none";
};

function upvote(n) {
  var revoke = document.getElementsByClassName("revoke");
  var upvote = document.getElementsByClassName("upvote");
  var downvote = document.getElementsByClassName("downvote");
  var spots = document.getElementsByClassName("spot_number");
  var reviews = document.getElementsByClassName("review_number");
  var vote = document.getElementsByClassName("votes");
  var votes = (parseInt(vote[n].innerHTML));
  vote[n].innerHTML = (votes += 1);
  $.ajax({
    type: 'PATCH',
    url:  "/spots/" + spots[n].innerHTML + "/reviews/" + reviews[n].innerHTML + "/upvote"
});
var data = {
  "user_id": parseInt(document.getElementById("user_number").innerHTML),
  "review_id": parseInt(reviews[n].innerHTML),
  "spot_id": parseInt(spots[n].innerHTML),
  "vote_value": 1
};
$.ajax({
  type: 'POST',
  url:  "/votes",
  contentType: "application/json",
      dataType: "json",
      data: JSON.stringify(data),
      success: function(response) {
          console.log(response);
      },
      error: function(response) {
          console.log(response);
      }
});
revoke[n].style.display = "inline-block";
upvote[n].style.display = "none";
downvote[n].style.display = "none";
};

function revoke(n) {
  var reviews = document.getElementsByClassName("review_number");
  $.ajax({
    type: 'DELETE',
    url:  "/votes/" + reviews[n].innerHTML,
    success: function(response) {
        console.log(response);
        if (Number(response.statusText) < 0) {
          var spots = document.getElementsByClassName("spot_number");
          var reviews = document.getElementsByClassName("review_number");
          var vote = document.getElementsByClassName("votes");
          var votes = parseInt(vote[n].innerHTML);
          vote[n].innerHTML = (votes += 1);
          $.ajax({
            type: 'PATCH',
            url:  "/spots/" + spots[n].innerHTML + "/reviews/" + reviews[n].innerHTML + "/upvote"
          });
        } else {
          var spots = document.getElementsByClassName("spot_number");
          var reviews = document.getElementsByClassName("review_number");
          var vote = document.getElementsByClassName("votes");
          var votes = (parseInt(vote[n].innerHTML));
          vote[n].innerHTML = (votes -= 1);
          $.ajax({
            type: 'PATCH',
            url:  "/spots/" + spots[n].innerHTML + "/reviews/" + reviews[n].innerHTML + "/downvote"
        });
        }
    },
    error: function(response) {
        console.log(response);
      }
  });
  var revokes = document.getElementsByClassName("revoke");
  var upvote = document.getElementsByClassName("upvote");
  var downvote = document.getElementsByClassName("downvote");
  revokes[n].style.display = "none";
  upvote[n].style.display = "inline-block";
  downvote[n].style.display = "inline-block";
};
