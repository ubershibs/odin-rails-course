Rails.application.routes.draw do
  root             'static_pages#home'
  get 'home'    => 'static_pages#home'
  get 'photos'  => 'statc_pages#photos'   
end
