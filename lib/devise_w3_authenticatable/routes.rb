ActionDispatch::Routing::Mapper.class_eval do
  protected
  def devise_w3_authenticatable(mapping, controllers)
    scope mapping.full_path do
      get  mapping.path_names[:sign_in],  :to => "#{controllers[:sessions]}#new",     :as => :"new_#{mapping.name}_session"
      post mapping.path_names[:sign_in],  :to => "#{controllers[:sessions]}#create",  :as => :"#{mapping.name}_session"
      get  mapping.path_names[:sign_out], :to => "#{controllers[:sessions]}#destroy", :as => :"destroy_#{mapping.name}_session"
    end
  end
end
