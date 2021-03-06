// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require nested_form_fields
//= require handlebars-v4.0.5

var FlashCard = require('./flash_cards.es6');
var StudySet = require('./study_sets.es6');

"use strict";

$(function(){
  initPage();
});

function initPage() {
  Handlebars.registerHelper("flashCardCount", function() {
    return this.flashCardCount();
  });

  attachListeners();
};

function addFlashCardListener(){
  $(document).on("click", "#addFlashCardButton", function() {
    $("#addFlashCard").toggleClass("hidden");
  });
};

function transformStudySets(studySets) {
  var sets = [];
  studySets.forEach(function(set){
    sets.push(new StudySet(set["id"], set["title"], set["description"], set["owner"], set["flash_cards"]))
  });
  return sets;
};

function getSearch() {
  var value = $("#search").val();

  $.get("/study_sets.json?search=" + value, function(sets) {
    if(sets.length === 0) {
      $(".col-md-4:not(:last)").html("");
      $("#searchResults").html("<p>Sorry, no study sets were found!</p><p>Try again or go <a href='/'>back</a></p>");
    } else {
      var str = { studySets: transformStudySets(sets)};
      var source = $("#studySet-template").html();
      var template = Handlebars.compile(source);
      $(".col-md-4:not(:last)").html("");
      $("#searchResults").html(template(str));
      $("#searchResults").append("<p><a href='/'>Back</a></p>")
    }
  });
};

function searchListener() {
  $(document).on("click", ".study_sets.index #searchButton", getSearch);
};

function studyModeListener() {
  $(document).on("click", ".study_sets.show #studyMode", studyMode)
};

function sortedStudyModeListener() {
  $(document).on("click", ".study_sets.sort #studyMode", studyMode)
};

function studyMode(event) {
    var ownerId = $(this).data("ownerId");
    var id = $(this).data("id");
    var url = "/users/" + ownerId + "/study_sets/" + id + "/study_mode";

    var jqxhr = $.get(url, function(data){
      var studySet = new StudySet(data["id"], data["title"], data["description"], data["owner"], data["flash_cards"]);
      var source = $("#studyMode-template").html();
      var template = Handlebars.compile(source);

      $("#study-sets").html(template(studySet));
  }).fail(function(){
    var alert = "<div class='flash-messages'><p class='alert'>You must be signed in to use this feature!</p></div>";
    $(alert).insertBefore(".jumbotron");
  });
};

function cardFlipListener() {
  $(document).on("click", ".study_sets.show .flip", function(){
      $(this).find(".card").toggleClass("flipped");
      return false;
  });
};

function submitNewFlashCardListener() {
  $(document).on("submit", ".study_sets.show .new_flash_card", function(event){
    event.preventDefault();
    var $form = $(".study_sets.show form");
    var values = $form.serialize();
    var $input = $(".study_sets.show input[type=submit]");
    var posting = $.post("/flash_cards", values);

    posting.done(function(data) {
      var source = $("#flashCard-template").html();
      var template = Handlebars.compile(source);
      var flashCard = new FlashCard(data["id"], data["term"], data["definition"], data["study_set"])
      $("#flash-cards").append(template(flashCard));
    });

    var $addFlashCard = $("#addFlashCard");
    $addFlashCard.addClass("hidden");
    $addFlashCard.find("input[type=text]").val("");
    $input.prop("disabled", false);

  });
};

function attachListeners(){
  searchListener();
  studyModeListener();
  cardFlipListener();
  addFlashCardListener();
  submitNewFlashCardListener();
  sortedStudyModeListener();
};
