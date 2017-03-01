# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create(email: "test@test.com", password: "password")

6.times do |i|
  @user.study_sets.create(title: "Study Set #{i+1}", description: "Description #{i+1}", owner: @user)
end

StudySet.all.each do |set|
  6.times do |i|
    set.flash_cards.create(term: "Term #{i+1}", definition: "Definition #{i+1}")
  end
end

@user_2 = User.create(email: "test2@test.com", password: "password")

@study_set_1 = @user_2.study_sets.create(title: "Numbers in Spanish", description: "Numbers...in Spanish", owner: @user_2)

@study_set_1.flash_cards.create(term: "Uno",definition: "One")
@study_set_1.flash_cards.create(term: "Dos",definition: "Two")
@study_set_1.flash_cards.create(term: "Tres",definition: "Three")
@study_set_1.flash_cards.create(term: "Cuatro",definition: "Four")
@study_set_1.flash_cards.create(term: "Cinco",definition: "Five")
@study_set_1.flash_cards.create(term: "Seis",definition: "Six")
@study_set_1.flash_cards.create(term: "Siete",definition: "Seven")
@study_set_1.flash_cards.create(term: "Ocho",definition: "Eight")
@study_set_1.flash_cards.create(term: "Nueve",definition: "Nine")
@study_set_1.flash_cards.create(term: "Diez",definition: "Ten")

@study_set_2 = @user_2.study_sets.create(title: "Distance from the Sun",description: "Distance of planets in our solar system to the sun, in Astronomical Units", owner: @user_2)
@study_set_2.flash_cards.create(term: "Mercury", definition: "0.4 AU")
@study_set_2.flash_cards.create(term: "Venus", definition: "0.7 AU")
@study_set_2.flash_cards.create(term: "Earth", definition: "1.0 AU")
@study_set_2.flash_cards.create(term: "Mars", definition: "1.5 AU")
@study_set_2.flash_cards.create(term: "Jupiter", definition: "5.2 AU")
@study_set_2.flash_cards.create(term: "Saturn", definition: "9.5 AU")
@study_set_2.flash_cards.create(term: "Uranus", definition: "19.2 AU")
@study_set_2.flash_cards.create(term: "Neptune", definition: "30.2 AU")
@study_set_2.flash_cards.create(term: "Pluto", definition: "39.5 AU")

@study_set_3 = @user_2.study_sets.create(title: "Common Literary Elements",description: "Literary terms and definitions", owner: @user_2)
@study_set_3.flash_cards.create(term: "Plot", definition: "The logical sequence of events that develops a story")
@study_set_3.flash_cards.create(term: "Setting", definition: "Refers to the time and place in which a story takes place")
@study_set_3.flash_cards.create(term: "Protagonist", definition: "The main character of a story, novel or play")
@study_set_3.flash_cards.create(term: "Antagonist", definition: "The character in conflict with the Protagonist")
@study_set_3.flash_cards.create(term: "Narrator", definition: "A person who tells the story")
@study_set_3.flash_cards.create(term: "Dialogue", definition: "Where characters of a narrative speak to one another")
@study_set_3.flash_cards.create(term: "Conflict", definition: "An issue in a narrative around which the whole story revolves")
@study_set_3.flash_cards.create(term: "Narrative Method", definition: "The manner in which a narrative is presented comprising plot and setting")
@study_set_3.flash_cards.create(term: "Mood", definition: "A general atmosphere of a narrative")
@study_set_3.flash_cards.create(term: "Theme", definition: "The central idea or concept of a story")

@user_3 = User.create(email: "test3@test.com", password: "password")

@study_set_1 = @user_3.study_sets.create(title: "Musical Terms", description: "Italian terms seen in written music", owner: @user_3)
@study_set_1.flash_cards.create(term: "A cappella",definition: "One or more vocalists performing without an accompaniment")
@study_set_1.flash_cards.create(term: "Cadenza",definition: "Improvised or written out passage for a soloist")
@study_set_1.flash_cards.create(term: "Da capo",definition: "An instruction to repeat the beginning of the piece before stopping on the final chord")
@study_set_1.flash_cards.create(term: "Espressivo",definition: "An instruction to play expressively")
@study_set_1.flash_cards.create(term: "Fermata",definition: "To hold a tone or rest beyond the written value at the discretion of the performer")
@study_set_1.flash_cards.create(term: "Forte",definition: "A symbol indicating to play loud")
@study_set_1.flash_cards.create(term: "Piano",definition: "A symbol indicating to play soft")
@study_set_1.flash_cards.create(term: "Glissando",definition:"Sliding between two notes")
@study_set_1.flash_cards.create(term: "Grazioso",definition:"Instruction to play gracefully")
@study_set_1.flash_cards.create(term: "Pizzicato",definition:"String instruments that are picked instead of bowed")
@study_set_1.flash_cards.create(term: "Presto",definition:"Instruction to play at a fast tempo")
@study_set_1.flash_cards.create(term: "Largo",definition: "Instruction to play at a slow tempo")

@study_set_2 = @user_3.study_sets.create(title: "Presidents Term Years",description: "Term years of famous US presidents", owner: @user_3)

@study_set_2.flash_cards.create(term: "George Washington",definition: "1789-1797")
@study_set_2.flash_cards.create(term: "Thomas Jefferson",definition: "1797-1801")
@study_set_2.flash_cards.create(term: "Andrew Jackson",definition: "1829-1837")
@study_set_2.flash_cards.create(term: "Abraham Lincoln",definition: "1861-1865")
@study_set_2.flash_cards.create(term: "Ulysses S. Grant",definition: "1869-1877")
@study_set_2.flash_cards.create(term: "Theodore Roosevelt",definition: "1901-1909")
@study_set_2.flash_cards.create(term: "Woodrow Wilson",definition: "1913-1921")
@study_set_2.flash_cards.create(term: "Herbert C. Hoover",definition: "1929-1933")
@study_set_2.flash_cards.create(term: "Franklin Delano Roosevelt",definition: "1933-1945")
@study_set_2.flash_cards.create(term: "Harry S Truman",definition: "1945-1953")
@study_set_2.flash_cards.create(term: "Dwight David Eisenhower",definition:"1953-1961")
@study_set_2.flash_cards.create(term: "John Fitzgerald Kennedy",definition:"1961-1963")
@study_set_2.flash_cards.create(term: "James Earl Carter, Jr.",definition:"1977-1981")
@study_set_2.flash_cards.create(term: "Ronald Wilson Reagan",definition:"1981-1989")
@study_set_2.flash_cards.create(term: "George H.W. Bush",definition:"1989-1993")
@study_set_2.flash_cards.create(term: "William Jefferson Clinton",definition:"1993-2001")

@study_set_3 = @user_3.study_sets.create(title: "Android Version Code Names",description:"Nicknames used for major Android releases", owner: @user_3)

@study_set_3.flash_cards.create(term: "Android 1.5",definition:"Cupcake")
@study_set_3.flash_cards.create(term: "Android 1.6",definition:"Donut")
@study_set_3.flash_cards.create(term: "Android 2.0-2.1",definition:"Eclair")
@study_set_3.flash_cards.create(term: "Android 2.2-2.2.3",definition:"Froyo")
@study_set_3.flash_cards.create(term: "Android 2.3-2.3.7",definition:"Gingerbread")
@study_set_3.flash_cards.create(term: "Android 3.0-3.2.6",definition:"Honeycomb")
@study_set_3.flash_cards.create(term: "Android 4.0-4.0.4",definition:"Ice Cream Sandwich")
@study_set_3.flash_cards.create(term: "Android 4.1-4.3.1",definition:"Jelly Bean")
@study_set_3.flash_cards.create(term: "Android 4.4-4.4.4",definition:"KitKat")
@study_set_3.flash_cards.create(term: "Android 5.0-5.1.1",definition:"Lollipop")
@study_set_3.flash_cards.create(term: "Android 6.0-6.0.1",definition:"Marshmallow")
@study_set_3.flash_cards.create(term: "Android 7",definition:"Nougat")
