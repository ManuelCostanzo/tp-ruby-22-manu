class Task < ApplicationRecord
	belongs_to :list, required: true
	belongs_to :status, required: true
	belongs_to :priority, required: true
	before_validation :verify_status, on: :update
	strip_attributes


	validates :priority_id, :description, :type, presence: true

	validates :description, length: { in: 4..255 }

	default_scope -> { order(priority_id: :asc) }
	scope :simple, -> { where(type: 'Simple')}
	scope :temporary, -> { where(type: 'Temporary') }
	scope :long, -> { where(type: 'Long') }
	scope :pending, -> { where(status_id: 1) }
	scope :in_progress, -> { where(status_id: 2) }
	scope :completed, -> { where(status_id: 3) }
	scope :expired, -> { where(status_id: 4) }

  class << self
    def types
      %w(Simple Temporary Long)
    end
  end

  private
		def verify_status
			if status_id_was == 3
				self.status_id = 3
			elsif status_id_was == 4
				self.status_id = 4
			end
		end
end