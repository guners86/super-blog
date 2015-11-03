class SessionsController < ApplicationController
    
    # Se ejecuta el merodo public_access para todas las acciones excepto destroy
    before_action :public_access, except: [:destroy]
    
    def new
        
    end
    
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            sign_in(user)
            redirect_to root_path
        else
            redirect_to login_path, notice: "Tu email y/o contraseña son inválidas. Intenta nuevamente."
        end
    end
end
