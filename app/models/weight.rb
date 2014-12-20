class Weight < ActiveRecord::Base
	
	default_scope { order('created_at DESC') }
	belongs_to :user
	validates :content, :inclusion => 1..500
end
