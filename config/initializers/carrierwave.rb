CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJ5NO35ICIIQELYIQ',                        # required
    :aws_secret_access_key  => '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',                        # required
    # :region                 => 'us-east-1',                  # optional, defaults to 'us-east-1'
    # :host                   => 's3.example.com',             # optional, defaults to nil
    # :endpoint               => 'ontwik.s3-website-us-east-1.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'ontwik'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
end
