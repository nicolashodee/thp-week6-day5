class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  has_many :comments

  has_secure_password

  validates :password,
    presence: { message: "Please enter a password" },
    length: { minimum: 6, too_short: "Password too short" }

  validates :email,
    presence: { message: "Enter your email" },
    uniqueness: { message: "Email already taken" },
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email" }

  validates :city_id,
    presence: { message: "Please choose a city"}

  def full_name
    "#{first_name} #{last_name}"
  end
end
