module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end

if Rails.env.test? # || Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false if Rails.env.test?
  end
else
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:                'AWS',
      aws_access_key_id:       ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key:   ENV['AWS_SECRET_ACCESS_KEY'],
      region:                  ENV['AWS_REGION']
    }
    config.fog_directory  = ENV['S3_BUCKET_NAME']
    config.storage = :fog
  end
end
