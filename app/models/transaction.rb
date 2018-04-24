class Transaction < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  def recipient
    User.find(self.recipient_id)
  end


  def pay
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
