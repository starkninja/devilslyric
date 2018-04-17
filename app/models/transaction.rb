class Transaction < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def recipient
    User.find(self.recipient_id)
  end

end
