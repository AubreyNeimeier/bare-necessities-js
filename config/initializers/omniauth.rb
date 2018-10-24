Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '1017226540823-p484b0or8it8k0egnb0gf13s49e7dodi.apps.googleusercontent.com', 'HT-n-8-c6rFrEqawc5n96FT0', skip_jwt: true
  end

  