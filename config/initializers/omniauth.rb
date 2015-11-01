Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'],
  {
    :secure_image_url => 'true',
    :image_size => 'original',
    :authorize_params => {
      :lang => 'en'
    }
  }
end