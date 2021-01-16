class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :text, presence: true
end
