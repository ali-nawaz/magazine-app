class Article < ApplicationRecord
  TAG_SEP = ','.freeze

  belongs_to :owner, class_name: 'User'

  has_many :taggings

  validates_presence_of :title, :content, :owner_id

  after_save :parse_tags, :parse_sub_tags

  attr_accessor :tags, :sub_tags

  private

  def parse_tags
    tags&.split(TAG_SEP)&.each do |tag|
      next if tag.strip.blank?

      tag_ar = Tag.where(name: tag.strip.downcase).first_or_create!
      taggings.where(tagger_type: Tag.name, tagger_id: tag_ar.id).first_or_create!
    end
  end

  def parse_sub_tags
    sub_tags&.split(TAG_SEP)&.each do |sub_tag|
      next if sub_tag.strip.blank?

      sub_tag_ar = SubTag.where(name: sub_tag.strip.downcase).first_or_create!
      taggings.where(tagger_type: SubTag.name, tagger_id: sub_tag_ar.id).first_or_create!
    end
  end
end
