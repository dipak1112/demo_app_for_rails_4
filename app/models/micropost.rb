class Micropost < ActiveRecord::Base

	## Relationships
	belongs_to :user

	## Validations
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
	
	## Scopes
	default_scope -> { order('created_at DESC') }
	
	## Methods
	def self.from_users_followed_by(user)
		followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
		where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
	end
end
