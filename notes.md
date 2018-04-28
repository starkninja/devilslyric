

----

  Profile page update - bio edit, show others' profiles

  Add ability to upload avatars
    http://www.peoplecancode.com/tutorials/users-avatars-uploading-images-using-paperclip
    https://gist.github.com/belgoros/b289a0b57b52d16b99d436ca9b80417f <-- deploying paperclip app to heroku

    Then, if time, add this with jQuery
    https://github.com/rsantamaria/papercrop
    https://stackoverflow.com/questions/21945531/jquery-jcrop-how-to-do-a-round-selection-is-it-even-possible - answer to making the selection circular

  Styling

  1.1 wishlist
      truncate user bios on pages where it was requested
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
    Add friend picker for sending coins
  The entire comment controller and views need to be done still

---

<% if @users.length > 0 %>
  <% @users.each do |user| %>
    <%= link_to image_tag(user.avatar_link), new_transaction_url, :recipient_id => user.id %> <%= link_to user.username, new_transaction_url, :recipient_id => user.id %> <br />
  <% end %>
<% else %>
  No friends! That's no fun!
<% end %>

  <input type=button value='logout'>
