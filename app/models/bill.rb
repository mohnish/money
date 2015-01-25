class Bill < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :repeat_interval
  has_many :tags, as: :entity
  has_many :payments

  validates_presence_of :repeat_interval
  validates_presence_of :next_due_date
  validates_presence_of :category
  validates_uniqueness_of :name, scope: :user
  validates_presence_of :user
  validates :amount, {
      presence: {
        message: 'please enter a valid amount'
      },
      numericality: {
        message: 'please enter a valid number'
      }
  }

end
