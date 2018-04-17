class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :transactions
  has_many :shouts
end
