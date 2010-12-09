Bookasite::Application.routes.draw do
  root :to => 'projects#index'

  namespace :admin do
    resources :pages
    resources :projects do
      resources :calls
    end
    resources :activities
    resources :users
  end

  scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
    resources :projects, :path => 'bookas' do
      resources :contents, :path => 'contenidos'
      resource :call, :path => "convocatoria"
      resource :proposal, :path => 'propuesta'
    end
    
  end


  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :signout
  match "/identificarse" => "sessions#new", :as => :login
end
