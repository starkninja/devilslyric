class Comment < ActiveRecord::Base
  #belongs_to :transaction - http://blog.blakesimpson.co.uk/read/59-fixing-the-you-tried-to-define-an-association-named-transaction-ruby-on-rails-error
  belongs_to :payment, foreign_key: "transaction_id", class_name: "Transaction"
end
