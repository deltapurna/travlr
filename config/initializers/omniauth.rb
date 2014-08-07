Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'ODiNeHIDq92MHWnkHfaLWS0CJ', 'UON5msZNxZhYgi3OQf5NDXuarbRRtbZr6xEuTiWMU1TDGv91Ms'
end
