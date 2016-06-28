class Job < ActiveRecord::Base
	include Impressionist::IsImpressionable
	has_attached_file :photo,
	storage: s3,
	:styles =>{
		:thumb =>"400x300#",
		:primary => "900x450#",
		:secondary => "400x200#"
	}
	do_not_validate_attachment_file_type :photo
	is_impressionable :counter_cache => true
end
