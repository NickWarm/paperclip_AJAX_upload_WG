Rails.application.routes.draw do
  # get 'api/image_upload'

  # get 'test/image'

  # View
  get '/image' => 'test#image'
  # AJAX
  put 'api/image_upload' => 'api#image_upload', as: :image_upload
end
