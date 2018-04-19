class Transaction < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def recipient
    User.find(self.recipient_id)
  end

  def pay
    # check if balance can cover the transaction
    # if so, complete the transaction and return success
    # if not, don't do it and return an error
  end

end
