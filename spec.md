# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) *StudySet has_many :flash_cards*
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) *FlashCard belongs_to :study_set*
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) *User has_many flash_cards, through: :study_sets*
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) *all models have validations*
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) *StudySet search*
- [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [x] Include signup *using Devise*
- [x] Include login *using Devise*
- [x] Include logout *using Devise*
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) *using Google OAuth2*
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [x] Include form display of validation errors (form URL e.g. /recipes/new) *validation errors for all forms*

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate *partials in `folders`, `layouts`, and `study_sets`*
