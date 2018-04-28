

----

Styling

  1.1 wishlist

      Shoutbox/shouts on profile

      Password recovery? - https://www.railstutorial.org/book/password_reset
      Omnniauth for Facebook/google authentication
      Then, if time, add this with jQuery
      https://github.com/rsantamaria/papercrop
      https://stackoverflow.com/questions/21945531/jquery-jcrop-how-to-do-a-round-selection-is-it-even-possible - answer to making the selection circular



DONE
----
  Active navbar icons - https://gist.github.com/mynameispj/5692162
  Add user accounts/authentication/sign-in once finished with Flatiron labs
    notifications
    Add friend picker for sending coins
  The entire comment controller and views need to be done still
    Profile page update - bio edit, show others' profiles
  Add ability to upload avatars
      http://www.peoplecancode.com/tutorials/users-avatars-uploading-images-using-paperclip
      https://gist.github.com/belgoros/b289a0b57b52d16b99d436ca9b80417f <-- deploying paperclip app to heroku
    truncate user bios on pages where it was requested
          Attack protection/sanitization
              style flash errors

---

<img src="<%= image_path(@user_profile.avatar_link) %>"><br />

arn:aws:iam::555626252092:user/admin
<%= transaction.created_at.in_time_zone("Eastern Time (US & Canada)").strftime("at %I:%M%p on %m/%d/%Y") %><br />
      <img src='<%= image_path(transaction.user.avatar_link) %>'> <br />






            <%= transaction.user.username %> paid <%= transaction.recipient.username %> <%= transaction.amount %> <br/ >

            <% comment_count = transaction.comments.count.to_s + " comments." %>
            <%= link_to comment_count, transaction %> <br />
            <hr>

----

<%= @transaction.created_at.in_time_zone("Eastern Time (US & Canada)").strftime("at %I:%M%p on %m/%d/%Y") %><br />
<img src='<%= image_path(@transaction.user.avatar_link) %>'> <br />
<%= @transaction.user.username %> paid <%= @transaction.recipient.username %> <%= @transaction.amount %> <br/ >
"<%= @transaction.note %>"<br />

<hr>

<%= form_for :comment, url: comments_path, method: :post do |f| %>
  <%= f.hidden_field(:transaction_id, value: @transaction.id) %>
  <%= f.hidden_field(:user_id, value: @user.id) %>
  <%= f.label :content, 'WRITE A COMMENT' %><br>
  <%= f.text_field :content %><br>

  <%= f.button "SEND" %>
<% end %>

<% if flash[:comment_error] %>
    <div class="notice"><%= flash[:comment_error] %></div>
<% end %>

<hr>

<% @comments.each do |comment| %>

  "<%= comment.content %>"<br />
  <%= image_tag(comment.user.avatar_link, class: "lil-avatar") %> - <%= comment.user.username %><br />
  <hr>

<% end %>

---

<% if @user_profile.avatar.present? %>
  <%= image_tag @user.avatar.url(:large) %>
<% else %>
  <%= image_tag("man.png") %><br />
<% end %>
<%= @user_profile.username %> - <%= image_tag("coin-icon.png") %><%= @user_profile.balance.to_s %><br />
<%= @user_profile.bio %>

<% if @user == @user_profile %>

  <% if @user.bio.nil? %>
    <%= link_to "Add a few words about yourself", edit_user_url(@user) %>
  <% else %>
    <%= link_to "Edit", edit_user_url(@user) %>
  <% end %>

  <%= form_tag ({controller: 'sessions', action: 'destroy', method: 'post'}) do %>
    <%= button_tag "Log Out" %>
  <% end %>

<% end %>

---
<h4> You can edit your bio here</h4>

<%= form_for @user, controller: 'users', action: 'update' do |f| %>

  <%= f.file_field :avatar %>

  <%= f.label :bio %>
  <%= f.text_field :bio %>

  <%= f.button "UPDATE" %>
<% end %>

----

<% @users.each do |user| %> <!-- eventually break this out to a partial -->
  <%= link_to image_tag(user.avatar_link), user %> <%= link_to user.username, user %> <br />
<% end %>

----

<h2>Send Bonecoin!</h2>
<% if flash[:transaction_error] %>
    <div class="notice"><%= flash[:transaction_error] %></div>
<% end %>
<!-- this form needs to be broken out to a partial -->
<% if @users.length > 0 %>
  <% @users.each do |receiver| %>
    <%= form_tag(controller: "transactions", action: "prep", method: "post") do %>
      <%= hidden_field_tag(:recipient_id, receiver.id) %>
        <%= image_tag(receiver.avatar_link) %> <%= submit_tag(receiver.username) %>
    <% end %>
  <% end %>
<% else %>
  No friends! That's no fun!
<% end %>


button do
  content_tag(:strong, 'Ask me!')
end

----
<!-- break this out to a partial -->
<%= form_for :transaction, url: transactions_path, method: :post do |f| %>
  <%= f.hidden_field(:recipient_id, value: @recipient.id) %>
  <%= f.hidden_field(:user_id, value: @user.id) %>
  <%= f.label :amount %><br>
  <%= f.number_field :amount, min: 0 %><br>
  <br>
  <%= f.label :note %><br>
  <%= f.text_field :note %><br>

  <%= f.button "Send Bonecoin!" %>
<% end %>
