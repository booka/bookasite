Bookasite::Application.routes.draw do
  root :to => 'projects#index'

  scope(:path_names => { :new => "crear", :edit => "editar" }) do
    namespace :admin do
      resources :pages, :path => 'paginas'
      resources :projects, :path => 'bookas' do
        resources :calls, :path => 'convocatorias'
        resources :contents, :path => 'materiales'
        resources :proposals, :path => 'propuestas'
      end
      resources :activities, :path => 'actividad'
      resources :users, :path => 'participantes'
      resources :bok_actions
    end
  end

  scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
    resources :projects, :path => 'bookas' do
      resources :contents, :path => 'materiales'
      resource :call, :path => "convocatoria"
      resource :proposal, :path => 'propuesta'
    end
  end


  match "/auth/:provider/callback" => "sessions#create"
  match "/cerrar" => "sessions#destroy", :as => :signout
  match "/identificarse" => "sessions#new", :as => :login
  match "/admin" => "admin/projects#index"
  match "/ccc" => "pages#ccc"
end
