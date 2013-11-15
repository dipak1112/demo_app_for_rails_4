class User < ActiveRecord::Base
	## Relationships
	has_many :microposts
end
