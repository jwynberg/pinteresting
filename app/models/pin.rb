# class Pin < ActiveRecord::Base
# 	belongs_to :user
# 	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

# 	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
# end

class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, 
            :styles => { :medium => "300x300>", :thumb => "100x100>" },
            :storage => :s3,
            :bucket  => ENV['S3_BUCKET_NAME']
    validates :image, presence: true
    validates :description, presence: true
		validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }


end
