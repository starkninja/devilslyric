class Shout < ActiveRecord::Base
  belongs_to :user

#--- If and when we implement shouts the notification system is here and ready to go
#--- BUT we should actually make separate column called "shout_notifications" or something
#--- and have a separate bubble over profile

  # after_create :send_notification

  # def send_notification #when a new shout is created notify the user who was shouted to
  #   user = self.user_id
  #   user.increment!(:unread) #add one to the unread count and save it
  # end

end
