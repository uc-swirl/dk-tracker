OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '405169683501-ir93uacaf01feid2l1c9a5m18bdk8qj1.apps.googleusercontent.com', 'QkP6GtbSpjf2h8G0MM75oZ_X', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end