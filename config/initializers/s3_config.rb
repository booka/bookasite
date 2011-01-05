
require 'ostruct'

S3Config = OpenStruct.new
local = ENV['S3_KEY'] ? {} : YAML::load(ERB.new(File.read("#{Rails.root}/config/amazon_s3.yml")).result)[Rails.env]

S3Config.access_key_id = ENV['S3_KEY'] ? ENV['S3_KEY'] : local['access_key_id']
S3Config.secret_access_key = ENV['S3_SECRET'] ? ENV['S3_SECRET'] : local['secret_access_key']
S3Config.bucket = ENV['S3_BUCKET'] ? ENV['S3_BUCKET'] : local['bucket']


puts "S3 '#{S3Config.access_key_id}' '#{S3Config.secret_access_key}' - #{S3Config.bucket}" if Rails.env == 'development'