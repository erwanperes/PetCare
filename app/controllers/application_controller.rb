class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # Protection Devise
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address])
  end
  
  def after_sign_in_path_for(resource)
    # Options les plus courantes :
    
    # 1. Redirection vers le tableau de bord
    dashboard_path
    
  
    # 2. Redirection vers une page spécifique selon le type d'utilisateur
    # case resource
    # when Admin
    #  admin_dashboard_path
    # when User
    # user_dashboard_path
    #else
    #  root_path
    #end
  
    # 3. Redirection vers la page précédente
    # stored_location_for(resource) || root_path
  
    # 4. Redirection avec des paramètres personnalisés
    # params[:redirect_to] || root_path
  end
end