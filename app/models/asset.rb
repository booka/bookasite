class Asset < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  has_attached_file :asset,
    :styles => {    :thumb=> "100x100#",     :small  => "400x400>" },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
    :path => "/:style/:filename"

  before_asset_post_process :allow_only_images

  def allow_only_images
    if !(asset.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$})
      return false
    end
  end
end
