# Pear - A Matching Service

## Authors

**Alex Nakagawa** [(Github)](https://github.com/alexnakagawa3) // **Evan Chang** [(Github)](https://github.com/pkmnfreak) // **Kyle Tse** [(Github)](https://github.com/tsekylekobie) // **Makena Fetzer** [(Github)](https://github.com/makenafetzer) // **Nick Shen** [(Github)](https://github.com/nickshen)

## Idea

<<<<<<< HEAD
This is a web application designed for college students to make deep personal connections with their peers through mutual interests. The idea is similar to the popular social media platform Tinder: a user is introduced to other users through a matching system. Each person is given an option to either pass or match with another user in the database after he or she reviews a profile, which may consist of a profile picture, major, age, and a brief bio. Once a person wishes to match with someone, the other person may choose to reciprocate the match request, at which point a Connection is made, and the two users may begin messaging each other.
=======
This is a web application designed for college students to make deep personal connections with their peers through mutual interests. The idea is similar to the popular social media platform Tinder: a user is introduced to other users through a matching system. Each person is given an option to either pass or match with another user in the database after he or she reviews a profile, which may consist of a profile picture, major, age, and interest tags. Once a person wishes to match with someone, the other person may choose to reciprocate the match request, at which point a Connection is made, and the two users may begin messaging each other. 
>>>>>>> 02617cf070734d63aa30aac4978a0e91fe378e8a

## Models and Description

There are 5 main models present in the app:

1. User

The user model has name, age, major, email, and login credentials through the devise gem.
Main associations for the user include: a user has many requests and connections. The user
is also self-joined to represent the mutual relationship between the user and other users
or matches.

2. Request

Requests have a user_id and requesting_id field and belong to user and match, which is an instance of user.

3. Messsage

The message model has a body, conversation_id, user_id, and a read field. Messages
belong to both a user and a conversation.

4. Conversation

A conversation has a sender_id and a recipient_id, and belongs to a sender and a
recipient. It also has a has many association with messages.

5. Connection

A connection belongs to a user and a match, which is a self-join of user. A connection
is created when a user accepts a request.


## Features

* Implemented a log-in system for Users.

* Users can Connect using match associations by either passing or requesting a match.

* User can add profile picture through email.

* Users can message each other through conversations.

* Users can view other user profiles

## Gems/APIs Added

* Devise [(Gem)](https://github.com/plataformatec/devise) - Log-in and authentication

* jquery-rails [(Gem)](https://rubygems.org/gems/jquery-rails) - for jquery framework

* turbolinks [(Gem)](https://github.com/turbolinks/turbolinks) - for easy navigating across web app

* foundation-rails [(Gem)](https://rubygems.org/gems/foundation-rails) - for sass framework and compass framework (styling on webpage)

* simple-form [(Gem)](https://rubygems.org/search?utf8=%E2%9C%93&query=simple-form) - for timestamps and dates

* bootstrap-sass [(Gem)](https://rubygems.org/gems/bootstrap-sass) - sass and bootstrap framework

* bootstrap-sass [(Gem)](https://rubygems.org/gems/bootstrap-sass) - sass and bootstrap framework

* carrierwave, mini_magick, fog - all for pictures

## Division of Labor

* Alex - Implemented pictures, Completed README write up, debugging, schema
* Evan - Edit user profiles, interests, 
* Kyle - Implemented messaging, debugging
* Makena - Match assoications, routing between users and interactions, README, video demo
* Nick - Styling (with jquery, bootstrap, sass), log-in, edit user profile, debugging

## Acknowledgments

* This project was made by students enrolled in the Ruby on Rails DeCal course at the University of California-Berkeley.
* Special thanks to the instructors for making this a fun class!
