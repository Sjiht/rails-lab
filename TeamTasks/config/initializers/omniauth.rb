Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '660224104048587', '7a88b2009581db03fab0b01edca38368'
end