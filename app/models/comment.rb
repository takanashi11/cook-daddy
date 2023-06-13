class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :user

  validates :comment_text,presence: true
end
