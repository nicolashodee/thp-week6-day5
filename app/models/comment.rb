class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip

  validates :user,
    presence: { message: "We could not find the corresponding user" }

  validates :gossip,
    presence: { message: "We could not find the corresponding gossip" }

  validates :content,
    presence: { message: "Content mandatory" }
end
