class Job < ActiveRecord::Base
	include Impressionist::IsImpressionable
	has_attached_file :photo
	do_not_validate_attachment_file_type :photo
	is_impressionable :counter_cache => true
end
