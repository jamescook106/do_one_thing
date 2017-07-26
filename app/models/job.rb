##############################################################################
#Job.rb
#This is the model for Job (opportunities)
##############################################################################

class Job < ActiveRecord::Base

	#Here is the appropiate line to record analytics
	include Impressionist::IsImpressionable

	#Validate certain aspects of the model and check that they are present
	validates :name, presence:true, length: { minimum: 2 }
	validates :url, presence:true
	validates :tagline, presence:true
	validates :short, presence:true
	validates :content, presence:true
	validates :contact, presence:true
	validates :release, presence:true
	validates :expiry, presence:true

	#Here we have the appropiate settings for using paperclip
	has_attached_file :photo,

	#The three different styles for the attached photos
	#Thumb is for the most popular section
	#Primary is for the spot on the top left of page
	#Secondary is for the spots on the top right of the page
	:styles =>{
		:thumb =>"400x300#",
		:primary => "900x450#",
		:secondary => "400x200#"
	}
	do_not_validate_attachment_file_type :photo
	is_impressionable :counter_cache => true

	def self.rexpire
		where("expiry > ? AND release < ?", Date.today, Date.today)
	end
end
