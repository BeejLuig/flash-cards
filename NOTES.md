#Flash Card Rails Application

##User flow:
- Home page is an index of user-created flash cards.
- A user signs in with an email and password or through OAuth.
- A logged in user can CRUD flash cards
- A logged in user can CRUD a collection of flash cards
- A logged in user can copy another user's flash card into their collection.
- A flash card keep tracks of how many times it has been copied.
- A logged in user can see one of their collections in "study mode" or "quiz mode"
- "Study mode" allows the user to see flash card questions and answers at the same time
- In "Quiz mode", only the questions on the flash cards are viewable at first. The answer on the flash card shows up after interacting with it.

##Gems

Use devise for logging in/out
Use omniauth for Google OAuth2
Use pundit for permissions?

**Policies**

A guest can only view the flash card index
A user can create cards and collections (but not for others)
A user can copy other users cards and collections (only if they are public)
A user can update their user info
A user can use "study mode" and "quiz mode" features for their collections

##Models

**User**

scope: [:owner, :studier]

has_many :study_sets
has_many :folders
has_many :flash_cards, through: :study_sets

attr_accessor
:email,
:password,
:image

**StudySet**

belongs_to :user, as: :owner
has_many :users, as: :studiers
has_and_belongs_to_many :folders (through study_sets_folders)

has_many :flash_cards

attr_accessor
:title,
:description,
:user_id,
:timestamp

**FlashCard**

belongs_to :study_set

attr_accessor
:term,
:definition,
:is_starred

**Folder**

has_and_belongs_to_many :study_sets (through study_sets_folders)
belongs_to :user

attr_accessor :name


**study_sets_folders** (join table, no model required)

belongs_to :folder
belongs_to :study_set


##SEARCH FUNCTION

Split search words into array
match against study set titles
match against flash card titles

Sanitize search query into a slug
redirect to subject/#{slug}

show list of titles in the view, sorted by most relevant (has the most studiers)
give option to sort by most recent (created at timestamp)



##Controllers


##Views
header => logged out: links to sign in, sign up. logged in: link to sign out
