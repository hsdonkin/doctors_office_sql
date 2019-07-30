Exercise Tuesday
Ruby and Rails Ruby Database Basics Doctor's Office, Animal Shelter
Text
Goal: Practice using the SQL Designer to create a database schema for one of the applications below. Practice implementing one-to-many and many-to-many relationships in your application.

Warm Up
What is the difference between a one-to-one, one-to-many, and many-to-many database relationship?
Come up with an example use case for each of the three database relationships listed in the previous question.
When would we use a hidden form field? What functionality would this offer?
If you were building databases for the following types of related information, what kind of relationships would the tables require?
Mobile devices and mobile apps
Online shoppers and usernames
Presidents and countries
Magazines and journalists
Farms and crops
Managers and employees
Humans and toothbrushes
Code
Record Store Continued
Walk through the lessons on implementing a many-to-many relationship with record store. Once you are done, consider implementing the following. Note that these are all potentially challenging and that this functionality won't be required for Friday's independent project. Rails will make all of this much easier next week.

Modify the update method so the same association can't show up in the join table multiple times. Hint: consider using PostgreSQL's EXISTS or try an upsert.
When trying to make an association between an Artist and an Album that doesn't exist, create the Album instance instead.
Update Artist#albums so it doesn't use an n+1 query. Consider looking at the optional join statement lesson in tonight's homework for a potential solution.
Come up with a solution to deal with the possibility that there might be multiple instances of Album with the same name. How could a user properly associate the correct Album with an Artist?
Doctor's Office
This program is for office administrators to track patients in a doctor's office. Here are some user stories to get started. Decide on your own whether you'd like to create a one-to-many or many-to-many relationship between doctors and patients.

As an administrator, I want to add a doctor to the database with a name and specialty.
As an administrator, I want to add a patient with their name and birthdate.
As an administrator, I want to be able to assign a patient to a doctor for care. (Hint: Doctors will have a one-to-many relationship with their patients.)
As a doctor, I want to see the list of patients that have been assigned to me.
Now the doctor's office has been grown to include many doctors with the same specialty. The doctors have organized themselves into specialty groups. So when an administrator wants to enter a doctor, they must first select a specialty group and then add a doctor.

As a patient, I want to see a list of all the doctors in a particular specialty. A doctor will only have one specialty. (Hint: change from storing specialty as a column to making a specialties table.)
As an administrator, I want to view an alphabetical list of doctors including the number of patients they see. (Hint: Do some online research for SQL ORDERing and COUNTing.)
Animal Shelter
Make a program for an animal shelter that tracks the animals needing homes and potential owners that have come to look at particular animals. Look through the user stories and design a database schema for your application. Build out the following:

As a shelter worker, I want to add animals to the system. An animal will have a name, gender, date of admittance, type (ex. cat/dog) and breed.
As a shelter worker, I want to add a person as a customer into the system. A customer should have a name, phone, animal type preference, and a breed preference.
As a potential owner, I want to see be able to see lists of animals by breed, type or by name alphabetically. (Hint: make separate pages for each of these, but write methods for these sorts)
As a shelter worker, I want to list animals chronologically - starting with the ones who have been in the shelter the longest.
As a shelter worker, I want to be able to see a list of customers by breed preference so if a specific breed arrives, I am able to contact potential owners for the animal.
As a shelter worker, I want to add an owner to an animal if that customer adopts.
Further Exploration
Add images and css to improve the user experience on your pages.
Explore HTML and Bootstrap options for forms and fields.
Add the ability for the shelter to assign volunteers or foster parents to specific animals.
Peer Code Review
Do database tables and columns follow standard naming conventions?
Is the database relationship in the project executed successfully?
Do the Sinatra routes follow convention?
Does the application function as expected?
Tracks
Previous
Next
Search lessons
 Learn to program at Epicodus
© 2019 Epicodus, Inc.
