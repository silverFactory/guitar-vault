class User < ActiveRecord::Base
  has_secure_password
  has_many :guitars
  has_many :amps
  has_many :pedals
end
