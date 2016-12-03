class Task < ApplicationRecord
	belongs_to :list, required: true
	belongs_to :status, required: true
	belongs_to :priority, required: true
	strip_attributes

	validates :priority, :description, :type, presence: true
	validates :description, length: { in: 4..255 }

	default_scope -> { order(priority_id: :asc) }
	scope :simple, -> { where(type: 'Simple')}
	scope :temporary, -> { where(type: 'Temporary') }
	scope :long, -> { where(type: 'Long') }
	scope :pending, -> { where(status_id: 1) }

  class << self
    def types
      %w(Simple Temporary Long)
    end
  end
end