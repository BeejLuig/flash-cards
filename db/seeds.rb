# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create(email: "test@test.com", password: "password")

5.times do |i|
  @user.folders.create(name: "Folder #{i+1}")
end

5.times do |i|
  @user.study_sets.create(title: "Study Set #{i+1}", description: "Description #{i+1}", owner: @user)
end

StudySet.all.each do |set|
  5.times do |i|
    set.flash_cards.create(term: "Term #{i+1}", definition: "Definition #{i+1}")
  end
end

@user2 = User.create(email: "test2@test.com", password: "password")
