class Space < ActiveRecord::Base
	belongs_to :user
	validates :name, :presence => true, :length => { :minimum => 5 }
	validates :address, :presence => true, :length => { :minimum => 10 }
	validates :description, :presence => true, :length => { :minimum => 50 }
end
