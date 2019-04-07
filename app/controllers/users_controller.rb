class UsersController < ApplicationController


  def new
  	    @user = User.new
  	  end
      
  def show
    @user = current_user
    @items = @user.items
  end

  def create
  	    @user = User.new(user_params)
  	    if @user.save
  	      redirect_to sign_in_path, notice: "Thanks! Please check your email to complete sign up"
  	    else
  	      render "new"
  	    end
  	  end

  private

  def user_paarams
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end


end
