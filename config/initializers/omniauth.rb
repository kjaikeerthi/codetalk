Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '987e60f6136047dd8686', '1dbb35374f590a1c5871ac4c6a959198486cefde'
end
