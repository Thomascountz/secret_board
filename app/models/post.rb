class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :body, presence: true, length: { minimum: 15 }
  belongs_to :user
end
