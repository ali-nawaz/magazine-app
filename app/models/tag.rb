class Tag < ApplicationRecord
  has_many :taggings, as: :tagger
  has_many :articles, through: :taggings
end
