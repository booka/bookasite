Bookasite::Application.routes.draw do
  root :to => 'projects#index'

  namespace :admin do
    resources :pages, :path => 'paginas'
    resources :projects, :path => 'bookas' do
      resources :calls, :path => 'convocatorias'
    end
    resources :activities, :path => 'actividad'
    resources :users, :path => 'participantes'
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
