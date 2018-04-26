class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :transactions
  has_many :shouts

  after_initialize :set_defaults, unless: :persisted?   # The set_defaults will only work if the object is new
  after_create :create_initial_transaction


  def set_defaults #give the new user some coins to get started - should maybe just put this in the schema at some point but eh
    self.balance ||= 10
  end
  #
  def create_initial_transaction #spoof the transaction to make the coins look like they were gifted by god
    initial_transaction = Transaction.new
    initial_transaction.recipient_id = self.id
    initial_transaction.user_id = User.find_by(username: "God").id
    initial_transaction.amount = 10
    initial_transaction.note = "Welcome to BoneCoin, mortal! A gift, to get you started."
    initial_transaction.save
  end

end
