# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    I am working via virtual box for the first time in flatiron so that I can use the ruby on rails framework. 
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
    An Event has_many Tasks. 
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
    An Event belongs_to a User
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
    A User has_many Tasks through Events. 
- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
    An Event has multiple user submittable attributes such as event.title and event.description. 
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    Basic validations are included. For exampe a user MUST have a username and password (presence) and their username must be unique. 
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Event.collect_weekly_events is a class level query. 
- [X] Include signup (how e.g. Devise)
    A user may continue with Google or create a username and password
- [X] Include login (how e.g. Devise)
    A user may login
- [X] Include logout (how e.g. Devise)
    A user may logout with a form(styled as a button)
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
    A user may continue with Google, which was configured with Omniauth
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
    Task show pages are nested within their events. 
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
    Tasks are created by immediately selecting their associated parent object, on the homepage. 
- [X] Include form display of validation errors (form URL e.g. /recipes/new)
    Errors messages are generated on the homepage when invalid data is submitted. 

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
