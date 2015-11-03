class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Metodo para autenticar al usuario
  def sign_in(user)
    cookies.permanent.signed[:user_id] = user.id
    @current_user = user
  end
  
  # Metodo para cerrar sesion del usuario
  def sign_out
    cookies.delete(:user_id)
    @current_user = nil
  end
  
  private
  
    # Metodo que valida si el usuario esta autenticado
    def signed_in?
      !current_user.nil?
    end
    helper_method :signed_in?
    
    # Metodo que devuelve el usuario que esta autenticado
    def current_user
      @current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
    rescue ActiveRecord::RecordNotFound
    end
    helper_method :current_user
  
end
