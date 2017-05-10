class StudySet {
  constructor(id, title, description, owner, flashCards = []){
    this.id = id
    this.title = title;
    this.description = description;
    this.ownerId = owner["id"];
    this.ownerImage = owner["image"]
    this.ownerEmail = owner["email"];
    this.flashCards = flashCards;
  };

  flashCardCount() {
    return this.flashCards.length
  }
};

module.exports = StudySet
