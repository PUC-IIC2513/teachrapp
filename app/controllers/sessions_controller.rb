class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by(email: params[:session][:email])
    if u.present? && u.password == params[:session][:password]
      # login successfull!
      session[:user_id] = u.id
      flash.notice = "Ingreso exitoso"
      redirect_to root_path
    else
      flash.now.alert = "Email o contraseña inválidos"
      render :new
    end
  end

  def destroy
    reset_session
  end
end
