class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth[:uid]) do |user|
      user.name = auth[:info][:name]
      user.uid = auth[:info][:uid]
    end
    session[:user_id] = @user.id
  end

  def auth
    request.env['omniauth.auth']
  end

end