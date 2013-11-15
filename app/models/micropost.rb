class Micropost < ActiveRecord::Base

	## Relationships
	belongs_to :user

	## Validations
	validates :content, length: { maximum: 140 }
	
end
