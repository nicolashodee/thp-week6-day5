class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_table_tag_gossips
  has_many :tags, through: :join_table_tag_gossips
  has_many :comments

  validates :title,
    presence: { message: "Please enter a title" },
    length: { minimum: 7, maximum: 60, message: "Title must be between 7 and 35 caracters"}
  validates :content,
    presence: { message: "Please enter a content" }
end
