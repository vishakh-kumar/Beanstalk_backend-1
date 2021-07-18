class Roaster < ApplicationRecord
  has_many :roasts

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
end
