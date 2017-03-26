"use strict"

$(function(){
  initPage();
});

function initPage() {
  Handlebars.registerHelper('flashCardCount', function() {
    return this.flashCardCount();
  });

  attachListeners();
}

class StudySet {
  constructor(id, title, description, owner, flashCards = []){
    this.id = id
    this.title = title;
    this.description = description;
    this.ownerId = owner["id"];
    this.ownerImage = owner["image"]
    this.ownerEmail = owner["email"];
    this.flashCards = flashCards;
  }

  flashCardCount() {
    return this.flashCards.length
  }
}

function addFlashCardListener(){
  $(document).on("click", "#addFlashCardButton", function() {
    $("#addFlashCard").toggleClass("hidden");
  });
}

function transformStudySets(studySets) {
  var sets = [];
  studySets.forEach(function(set){
    sets.push(new StudySet(set["id"], set["title"], set["description"], set["owner"], set["flash_cards"]))
  });
  return sets;
}

function getSearch() {
  var value = $("#search").val();

  $.get("/study_sets.json?search=" + value, function(sets) {
    if(sets.length === 0) {
      $(".col-md-4:not(:last)").html("");
      $("#searchResults").html('<p>Sorry, no study sets were found!</p><p>Try again or go <a href="/">back</a></p>');
    } else {
      var str = { studySets: transformStudySets(sets)};
      var source = $("#studySet-template").html();
      var template = Handlebars.compile(source);
      $(".col-md-4:not(:last)").html("");
      $("#searchResults").html(template(str));
      $("#searchResults").append("<p><a href='/'>Back</a></p>")
    }
  });
}

function searchListener() {
  $(document).on("click", ".study_sets.index #searchButton", getSearch);
}

function studyModeListener() {
  $(document).on("click", ".study_sets.show #studyMode", function(event){

    var ownerId = $(this).data("ownerId");
    var id = $(this).data("id");
    var url = "/users/" + ownerId + "/study_sets/" + id + "/study_mode";

    $.get(url, function(data){
      var studySet = new StudySet(data["id"], data["title"], data["description"], data["owner"], data["flash_cards"]);
      var source = $("#studyMode-template").html();
      var template = Handlebars.compile(source);

      $("#study-sets").html(template(studySet));
    });
  });
}

function cardFlipListener() {
  $(document).on("click", ".study_sets.show .flip", function(){
      $(this).find('.card').toggleClass('flipped')
      return false;
  });
}

function submitNewFlashCardListener() {
  $(document).on("submit", ".study_sets.show form", function(event){
    event.preventDefault();
    var $form = $(".study_sets.show form");
    var values = $form.serialize();
    var $input = $(".study_sets.show input[type=submit]");
    var posting = $.post('/flash_cards', values);

    posting.done(function(data) {
      var source = $("#flashCard-template");
      var template = Handlebars.compile(source);

      //TODO
    });
    $input.prop("disabled", false);
  });
}

function attachListeners(){
  searchListener();
  studyModeListener();
  cardFlipListener();
  addFlashCardListener();
  submitNewFlashCardListener();
}
