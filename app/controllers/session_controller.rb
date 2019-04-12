class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

def show
  @user = User.find(params[:id])

end

  def create

    @user = User.find_by(email: params:[:session][:email].downcase)

    if user & user.authenticate(params[:session][:password])
      create_sesssion(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'invalid email/password combination'
      render :new
    end
  end
  def destroy
    destroy_session(current_user)
    flash[:notice] = "You have been  signed out"

    redirect_to root_path
  end
end
