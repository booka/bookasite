Bookasite::Application.routes.draw do
  root :to => 'series#index'

  # PUBLIC
  scope(:path_names => {:new => "nuevo", :edit => "editar"}) do
    resources :projects, :path => 'bookas' do
      resources :contents, :path => 'materiales'
      resource :call, :path => "convocatoria"
      resource :proposal, :path => 'propuesta'
    end
    resources :series
  end

  # AJAX
  resources :boks

  # ADMIN
  scope(:path_names => {:new => "crear", :edit => "editar"}) do
    namespace :admin do
      resources :pages, :path => 'paginas'
      resources :series
      resources :projects, :path => 'bookas' do
        resources :calls, :path => 'convocatorias'
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
end
