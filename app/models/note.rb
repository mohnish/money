class Note < ActiveRecord::Base
  belongs_to :entity, polymorphic: true
end
