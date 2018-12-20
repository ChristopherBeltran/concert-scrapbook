# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  *Sinatra was required in the ApplicationController class, which was then extended to my Users, Concerts, Artists and Venues controllers*
- [x] Use ActiveRecord for storing information in a database
  *ActiveRecord was utilized to create database tables in Postgresql for Users, Concerts, Venues and Artists*
- [x] Include more than one model class (e.g. User, Post, Category)
  *Implemented models for User, Concert, Artist, and Venue*
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  *Implemented 3 has_many relationships(User: has_many :concerts, Artist: has_many :concerts, Venue: has_many :concerts), as well as 2 has_many_through relationships(Artist: has_many :venues, through: :concerts, Venue: has_many :artists, through: :concerts)*
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  *The Concert class belongs_to a User, a Venue, and an Artist*
- [x] Include user accounts with unique login attribute (username or email)
  *Implemented a sign up and log in flow that allows a user to sign up for an account with a username and email, and then log in with either credential*
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  *The Concert controller includes routes for Creating through the /new-concert route, for Reading through the /myconcerts route, for Updating through the /myconcerts/:id/edit route, and for Destroying through the /myconcerts/:id/delete*
- [x] Ensure that users can't modify content created by other users
  *The Edit concert page contains a check that will redirect a user who's user id does not match that of the concert user id*
- [x] Include user input validations
  *I've included the "required" attribute in the erb file for all form input fields, included the Email validator gem that will validate appropriate email entries, as well as multiple failure checks within the signup route*
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
  *I've utilized sinatra-flash to display error messages for a username already in use, email already in use, invalid email, invalid password.*
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
