class Tagging < ApplicationRecord
  belongs_to :article
  belongs_to :tagger, polymorphic: true

  belongs_to :tag,        -> { where(taggings: { tagger_type: Tag.name }) },
             class_name:  'Tag',
             foreign_key: 'tagger_id',
             optional:    true

  belongs_to :sub_tag,    -> { where(taggings: { tagger_type: SubTag.name }) },
             class_name:  'SubTag',
             foreign_key: 'tagger_id',
             optional:    true
end
