ActionController::Routing::RouteSet::Mapper.class_eval do
  protected
  alias :w3_authenticatable :database_authenticatable
end
