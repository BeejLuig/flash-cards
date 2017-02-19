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
Use omniauth for OAuth (log in with Google?)
Use pundit for permissions?

**Policies**

A guest can only view the flash card index
A user can create cards and collections (but not for others)
A user can copy other users cards and collections (only if they are public)
A user can update their user info
A user can use "study mode" and "quiz mode" features for their collections

##Models
**User**
scope user
validates email, password
has_many flash_cards
has_many collections

**FlashCard**
attributes:
- question
- answer
- owner_id
- author_id
- original (bool)
- copy_count


has_many categories, through flash_card_categories
belongs_to user, as: owner
belongs_to user, as: author
has_many collections, through flash_card_collections

**Collection**
attributes:
- name

belongs_to user, as: owner
belongs_to user, as: author
has_many flash_cards, through flash_card_collections
has_many categories, through flash_cards

**Category**
attributes:
- name  

has_many flash_cards, through flash_card_categories

**FlashCardCollections**
belongs_to flash_card
belongs_to collection

**FlashCardCategories**
belongs_to flash_card
belongs_to categories

##Controllers


##Views
header => logged out: links to sign in, sign up. logged in: link to sign out
