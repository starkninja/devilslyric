class Transaction < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :amount, :numericality => { :greater_than_or_equal_to => 1 } #can't send a payment for less than 1 - would schema have been a better place?

  after_create :send_notification

  def send_notification #when a new transaction is created notify every user
    @users = User.all
    @users.each do |user| #there MUST be a better way to add one to a whole column than iterating over it but I can't find one
      user.increment!(:unread) #add one to the unread count and save it
    end
  end

  def recipient #return the user object for the recipient
    User.find(self.recipient_id)
  end

  def pay #execute the payment by altering the balances
    # check if balance can cover the transaction
    # if so, complete the transaction and return success
    # if not, don't do it and return an error
    receiver = self.recipient
    giver = self.user


    if giver.balance >= self.amount

      giver.balance -= self.amount
      receiver.balance += self.amount
      giver.save
      receiver.save

      return true

    else

      return false
        #this is fine for now but
        #how best to send other errors?
        #http://api.rubyonrails.org/classes/ActiveModel/Errors.html

    end

  end

end
