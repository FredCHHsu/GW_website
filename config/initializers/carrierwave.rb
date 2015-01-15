CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => Rails.application.secrets.S3_KEY,
    :aws_secret_access_key => Rails.application.secrets.S3_SECRET,
    :region                => ENV['S3_REGION']
  }

  config.fog_directory =  ENV['S3_BUCKET_NAME']
  config.cache_dir     = "#{Rails.root}/tmp/uploads"   # For Heroku

  # For development, testing, upload files to local `tmp` folder.
  # if Rails.env.test? || Rails.env.cucumber? || Rails.env.development?
  #   config.storage = :file
  #   config.enable_processing = false
  #   config.root = "#{Rails.root}/tmp"
  # else
  #   config.storage = :fog
  # end
end