class Guitar < ActiveRecord::Base
  belongs_to :user
  belongs_to :manufacturer
end
