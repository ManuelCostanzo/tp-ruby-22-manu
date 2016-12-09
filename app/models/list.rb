class List < ApplicationRecord
	has_many :tasks, dependent: :destroy
	before_validation :to_slug, on: :create
	strip_attributes

	delegate :simple, :longs, :temporaries, to: :tasks
	
	validates :title, format: { 
	    with: /\A[a-zA-Z0-9\p{Cyrillic}\p{Latin} ]+\z/,
	    message: "only allows letters and numbers" },
	    length: { in: 4..40 }, presence: true

	validates :url, uniqueness: true, presence: true, on: :create

	  def to_param
	    url
	  end

	  private
			def to_slug
				self.url = self.title.parameterize if !self.title.nil?
			end
end
