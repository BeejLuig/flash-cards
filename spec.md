# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) *StudySet has_many :flash_cards*
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) *FlashCard belongs_to :study_set*
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) *User has_many flash_cards, through: :study_sets*
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) *all models have validations*
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) *StudySet search*
- [x] Include a nested form writing to an associated model using a custom attribute writer *add flash cards in study_set form*
- [x] Include signup *using Devise*
- [x] Include login *using Devise*
- [x] Include logout *using Devise*
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) *using Google OAuth2*
- [x] Include nested resource show or index *users/:id/study_sets/:id*
- [x] Include nested resource "new" form *users/:id/study_sets/new*
- [x] Include form display of validation errors (form URL e.g. /recipes/new) *validation errors for all forms*

Confirm:
- [x] The application is pretty DRY - *repeated view elements moved to partials, repeated logic moved to helper methods*
- [x] Limited logic in controllers - *extra logic moved to models of `StudySet` and `User`*
- [x] Views use helper methods if appropriate - *no helpers necessary in the views...yet*
- [x] Views use partials if appropriate *partials in `folders`, `layouts`, and `study_sets`*
