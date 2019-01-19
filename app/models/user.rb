class User < ApplicationRecord
  has_many :projects
  has_many :tickets

  has_secure_password validations: false
  
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
end