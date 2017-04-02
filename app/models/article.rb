class Article < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates_presence_of :title, :content, :owner_id
end
