class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  allow_browser versions: :modern

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "Você não tem permissão para acessar esta página."
  end  
end
