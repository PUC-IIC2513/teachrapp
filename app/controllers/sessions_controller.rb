class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by(email: params[:session][:email])
    if u.try(:authenticate, params[:session][:password])
      # login successfull!
      session[:user_id] = u.id
      # flash.notice = "Ingreso exitoso"
      # o usemos la opción de redirect_to, que es equivalente
      redirect_to root_path, notice: "Ingreso exitoso"
    else
      flash.now.alert = "Email o contraseña inválidos"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Sesión cerrada exitosamente"
  end
end
