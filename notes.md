

----

  Add friend picker for sending coins - do we need to use a form an make each one a button maybe?
  - NO - each user listing its own form, with only a submit button, and a hidden field including the user id! It's *genius*!!
  - they can work just like the 'logout' button

  The entire comment controller and views need to be done still

  Styling



  Add ability to upload avatars
    http://www.peoplecancode.com/tutorials/users-avatars-uploading-images-using-paperclip
    https://gist.github.com/belgoros/b289a0b57b52d16b99d436ca9b80417f <-- deploying paperclip app to heroku

    Then, if time, add this with jQuery
    https://github.com/rsantamaria/papercrop
    https://stackoverflow.com/questions/21945531/jquery-jcrop-how-to-do-a-round-selection-is-it-even-possible - answer to making the selection circular

  1.1 wishlist
      Password recovery? - https://www.railstutorial.org/book/password_reset
      Shoutbox/shouts on profile
      Attack protection/sanitization
      Omnniauth for Facebook/google authentication
      style flash errors



DONE
----
  Active navbar icons - https://gist.github.com/mynameispj/5692162
  Add user accounts/authentication/sign-in once finished with Flatiron labs
    notifications


---

<% if @users.length > 0 %>
  <% @users.each do |user| %>
    <%= link_to image_tag(user.avatar_link), new_transaction_url, :recipient_id => user.id %> <%= link_to user.username, new_transaction_url, :recipient_id => user.id %> <br />
  <% end %>
<% else %>
  No friends! That's no fun!
<% end %>
