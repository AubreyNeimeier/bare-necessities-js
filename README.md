
## Application Description

"Bare Necessities JS" is a simple calendar (hence the name) with features to add events, and their related tasks. This project is a replica of my third project, "Bare Necessities", however it has been refactored to include dymnamic features only possible with JavaScript and a JSON API. For example, the new event form will submit and the page will update without a page reload. The project is loosely modeled after Google’s Calendar. Each user may choose to create their own login or login with their Google account.

Each user has the following features available to them. 

-Login with Google 
-Create an Event, with a title, description, date, start and end time. 
-Create a Task related to an Event. A user can create multiple tasks as a to-do list specific for the event. 
-The Week Ahead report which lists all events and tasks for the upcoming calendar week
-Error message generation upon submitting a form with invalid data, preventing bad data from being saved. 


## In order to get my application up and running

1. Using the terminal from the project's parent directory, enter the following commands:
bundle install
rake db:migrate

2. Seed the database by entering command:
rails db:seed
3. Launch a local server with command:
rails s 
4. In your local browser, navigate to 

http://localhost:3000

5. Create an account or Continue with Google

6. Add events and their related tasks with the forms on the homepage! 

## Licensing Statement

This project has been licensed under the MIT open source license.
License information for the project is proved in the LICENSE.MD file in this directory.
* ...
## Contributers Guide

This project is not open for contributions from the public. Thank you.
# bare-necessities-js
