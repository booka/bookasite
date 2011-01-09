# encoding: utf-8

class ProposalUploader < CarrierWave::Uploader::Base
storage :s3

  def store_dir
    "proposal/#{model.id}/#{mounted_as}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
end
