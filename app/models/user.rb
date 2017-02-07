# frozen_string_literal: true
# User model
class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :posts
end
