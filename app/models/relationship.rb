class Relationship < ActiveRecord::Base
	belongs_to :follower, classname: "User"
	belongs_to :followed, classname: "User"
end
