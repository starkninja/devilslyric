class User < ActiveRecord::Base
  has_many :comments
  has_many :transactions
  has_many :shouts
end
