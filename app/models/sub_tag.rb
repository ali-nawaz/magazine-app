class SubTag < ApplicationRecord
  belongs_to :tag, optional: true

  has_many :taggings, as: :tagger
  has_many :articles, through: :taggings
end
