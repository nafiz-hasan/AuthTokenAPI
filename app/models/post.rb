# frozen_string_literal: true
# Post model
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :user, presence: true
  validates :title, presence: true
end
