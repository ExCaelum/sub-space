class SessionsController < ApplicationController

  def create
    if User.find_by(uid: (request.env["omniauth.auth"]).uid)
      user = User.find_by(uid: (request.env["omniauth.auth"]).uid)
      user.update(token: request.env["omniauth.auth"].credentials.token)
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
     user = User.from_omniauth(request.env["omniauth.auth"])
     session[:user_id] = user.id
     redirect_to setup_path
    end
  end

end
