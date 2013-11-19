class Micropost < ActiveRecord::Base

	## Relationships
	belongs_to :user

	## Validations
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
	
	## Scopes
	default_scope -> { order('created_at DESC') }
	
end
