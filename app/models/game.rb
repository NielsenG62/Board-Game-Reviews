class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
end