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

  # ADMIN
  scope(:path_names => {:new => "crear", :edit => "editar"}) do
    namespace :admin do
      resources :pages, :path => 'paginas'
      resources :series
      resources :projects, :path => 'bookas' do
        resources :calls, :path => 'intro'
        resources :contents, :path => 'materiales' do
          resources :assets, :path => 'ficheros'
        end
        resources :proposals, :path => 'propuestas'
        resources :assets, :path => 'ficheros'
      end
      resources :activities, :path => 'actividad'
      resources :users, :path => 'participantes' do
        resources :permissions, :path => 'permisos'
      end
      resources :bok_actions
    end
  end


  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :logout
  match "/identificarse" => "sessions#new", :as => :login
  match "/admin" => "admin/projects#index"
  match "/ccc" => "pages#ccc"

  if !Rails.env.production?
    match "/enter/:id" => "sessions#enter", :as => :enter
  end
end
