class Post < ActiveRecord::Base

	#default_scope order: 'createdat: DESC'
	default_scope { order('created_at') }
	#attr_accessible :content, :userid 
	belongs_to :user

	validates :content, length: { maximum: 140 }
end
