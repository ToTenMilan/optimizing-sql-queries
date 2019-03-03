Rails.application.configure do
  config.middleware.use OmniAuth::Builder do
    provider(
      :auth0,
      ENV['AUTH0_CLIENT_ID'],
      ENV['AUTH0_CLIENT_SECRET'],
      ENV['AUTH0_DOMAIN'],
      callback_path: '/auth/auth0/callback',
      authorize_params: {
        scope: 'openid profile'
      }
    )
  end

  config.auth0_domain = ENVied.AUTH0_DOMAIN
  config.auth0_client_id = ENVied.AUTH0_CLIENT_ID
end