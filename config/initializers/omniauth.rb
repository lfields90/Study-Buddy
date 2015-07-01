OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_PUBLIC_KEY'], ENV['FACEBOOK_PRIVATE_KEY']
end
