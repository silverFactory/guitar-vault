class Manufacturer < ActiveRecord::Base
  has_many :guitars
  has_many :amps
  has_many :pedals
end
