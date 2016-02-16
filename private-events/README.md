#README
##Private Events

Building this app as part of The Odin Project's Rails Course - Project: Active Record Associations - Project 2. Details can be found on [the project's site](http://www.theodinproject.com/ruby-on-rails/associations?ref=lnav).

At this point, the project is essentially complete, except for:
* The extra-credit option to allow only invited users to rsvp
* Styling - lots of styling
* Tests

What works:
* Sign up for the system with a name and email
* User remains logged in until they log out or their session ends
* User has a profile page that lists the events they're hosting/hosted, and the upcoming and past events they've attended (scoped).
  * Users only see the "+" to add a new event when viewing their own profile
* Events are all lists on an index page, separate (scoped) into upcoming and past
* Event details and attendees are presented on a show page.
  * Logged in users viewing upcoming events see an "Attend" button if they are not yet RSVPed, or a "Cancel RSVP" button if they have. Logged out users can see this page, but not that button.