class StudySet {
  constructor(title, description, ownerEmail, flashCards = []){
    this.title = title;
    this.description = description;
    this.ownerEmail = ownerEmail;
    this.flashCards = flashCards;
  }
}

var attachListeners = function(){
  searchStudySetHandler();
}

$(function(){
  attachListeners();
})
