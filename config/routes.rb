Rails.application.routes.draw do
  root :to => "api/v1/collections#index"
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :collections, only: [:create, :index, :show]
    end
  end
  # get 'react_start', to: 'api/v1/collections#react_start'
  get 'backbone_start', to: 'api/v1/collections#backbone_start'

  # http://localhost:3000/api/v1/collections.json

  # resources :collections do
  #   collection do
  #     get 'search'
  #   end
  # end


  # scope 'api/v1' do
  #   resources :collections do
  #     collection do
  #       get 'search'
  #     end
  #     resources :insta_posts
  #   end
  # end

end