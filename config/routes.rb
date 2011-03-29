Bookasite::Application.routes.draw do
  root :to => 'series#index'

  # AJAX
  resources :boks

  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :logout
  match "/identificarse" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter
  match "/work" => "jobs#work", :as => :work

  # PUBLIC
  scope(:path_names => {:new => "nuevo", :edit => "editar"}) do
    scope "/admin" do
      resources :users, :path => 'participantes'
      resources :jobs, :path => 'trabajos'
      resources :activities, :path => 'actividad'
      resources :versions, :path => 'versiones'
      resources :asubs, :path => 'subscripciones'
    end

    scope "/models" do
      resources :topics, :only => :show
      resources :asambleas, :only => :show
      resources :calls, :only => :show
      resources :contents, :only => :show
    end

    resources :projects, :path => '' do
      resources :permissions, :path => 'participantes'
      resources :contents, :path => 'materiales'
      resources :asambleas, :path => 'edicion' do
        resources :topics, :path => 't'
      end
      resource :call, :path => 'intro'
      resources :calls, :path => "intros"
      resource :proposal, :path => 'propuesta'
      resources :proposasl, :path => 'propuestas'
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


end
