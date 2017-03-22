class StudySet {
  constructor(title, description, ownerEmail, flashCards = []){
    this.title = title;
    this.description = description;
    this.ownerEmail = ownerEmail;
    this.flashCards = flashCards;
  }
}

var searchStudySets = function() {
  $.get("/study_sets.json").done(function(data) {
    console.log(data);
    return data;
  })
}

var searchStudySetHandler = function() {
  $("#search-form").submit(function(event) {
    var data = searchStudySets();
    event.preventDefault();
  });
}

var attachListeners = function(){
  searchStudySetHandler();
}

$(function(){
  attachListeners();
})
