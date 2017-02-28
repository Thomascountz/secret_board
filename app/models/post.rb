class Post < ApplicationRecord
  validates :body, presence: true, length: { minimum: 15 }
  belongs_to :user
end
