class User < ApplicationRecord
  self.primary_key = 'uid'
  has_many :posts, foreign_key: 'user_uid', dependent: :destroy
end