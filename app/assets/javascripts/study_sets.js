class StudySet {
  constructor(title, description, owner, flashCards = []){
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

function transformStudySets(studySets) {
  sets = [];
  studySets.forEach(function(set){
    sets.push(new StudySet(set["title"], set["description"], set["owner"], set["flash_cards"]))
  });
  return sets;
}

var getSearch = function() {
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

var searchListener = function() {
  $("[value=Search]").click(function(event){
    event.preventDefault();
    getSearch();
  });
}

var studyModeListener = function() {
  //TODO
}

var attachListeners = function(){
  searchListener();
}

$(function(){
  Handlebars.registerHelper('flashCardCount', function() {
    return this.flashCardCount();
  });

  attachListeners();
})
