Bookasite::Application.routes.draw do
  root :to => 'series#index'

  # PUBLIC
  scope(:path_names => {:new => "nuevo", :edit => "editar"}) do
    resources :users, :path => 'participantes'

    resources :projects, :path => 'b' do
      resources :permissions, :path => 'participantes'
      resources :contents, :path => 'materiales'
      resources :asambleas, :path => 'edicion' do
        resources :topics, :path => 't'
      end
      resource :call, :path => "intro"
      resource :proposal, :path => 'propuesta'
    end
    resources :series

    resources :topics do
      resources :answers
      resources :comments
    end
    resources :answers do
      resources :comments
    end
  end

  # AJAX
  resources :boks

  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :logout
  match "/identificarse" => "sessions#new", :as => :login
  match "/admin" => "admin/projects#index"
  match "/ccc" => "pages#ccc"

  if !Rails.env.production?
    match "/enter/:id" => "sessions#enter", :as => :enter
  end
end
