class Tag < ActiveRecord::Base
  belongs_to :entity, polymorphic: true

  validates_uniqueness_of :name, scope: [:entity_type, :entity_id]
end
