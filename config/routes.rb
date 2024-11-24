Rails.application.routes.draw do
  resources :novels do
    resources :chapters
  end
end
