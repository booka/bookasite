# encoding: utf-8

class AssetUploader < CarrierWave::Uploader::Base
  storage :s3

  def store_dir
    "booka/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
end
