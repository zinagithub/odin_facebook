# README
# Building Facebook Project :
 In this project we have to build an application whose fonctionnalities are similar to that of Facebook.

 **Prerequisites:**
 * Ruby
 * Ruby on Rails
 * SQL
 * Heroku
 * Git

 **How we will create our social networking site?**
 We need to create three systems:
 * a system for managing users
 * a system for managing posts
 * a system for managing comments

**Main Model:**
our main model will contain this three models

* Users model : To generate the user model we will use the gem Devise.

* Posts model : user can create many posts and share them
* Comments model : users can comment posts

**Relationships models**
* freindship : user has many freindships
* likes : user can likes a post or many posts
* freind_requests : Users can send freind request to other users and user must accept the freind request to become friends

![Entity Relationship Diagram](./db_diagram.png)

**Controllers:**
* Users :
  * authentication with devise gem. Users must sign in to see anything except the sign in page
  * user can sign in with facebook (done with omniauth gem)
* Posts :
  * user can create posts
  * user can edit and delete his and only his posts
* Likes:
  * user is able to like and unlike posts without page refresh 
* Comments
  * user is able to comment on posts
  * user can edit and delete his and only his comments
* Friend requests:
  * user can send and and accept and refuse friend requests without page refresh

**Views:**
* Users:
  * show: has profile information, gravatar and user's posts
  * index - all users with a button to send a friend request
  * new
  * edit
* Posts:
  * index - displays posts from current user and current user's friends
  * post always displays it's content, author likes and comments
* Friend requests:
  * notification page with all requests user has pending 