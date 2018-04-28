class Comment < ActiveRecord::Base
  #belongs_to :transaction - http://blog.blakesimpson.co.uk/read/59-fixing-the-you-tried-to-define-an-association-named-transaction-ruby-on-rails-error
  belongs_to :payment, foreign_key: "transaction_id", class_name: "Transaction"
  belongs_to :user
  validates :user_id, :transaction_id, presence: true
  validates :content, length: { minimum: 1 }, presence: true
  after_create :send_notification

  def send_notification #when a new comment is created annoy every user
    @users = User.all
    @users.each do |user| #there MUST be a better way to add one to a whole column than iterating over it but I can't find one
      user.increment!(:unread) #add one to the unread count and save it
    end
  end

end
