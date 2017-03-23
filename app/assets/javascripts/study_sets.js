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

var attachListeners = function(){
}

$(function(){
  attachListeners()
  $.get("/study_sets.json", function(sets) {
    var data = { studySets: transformStudySets(sets)}
    console.log(data);
    var source = $("#studySet-template").html();
    var template = Handlebars.compile(source);
    $("#searchResults").html(template(data))
  });
})
