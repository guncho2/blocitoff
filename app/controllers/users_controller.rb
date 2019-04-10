class UsersController < ApplicationController


  before_action :authenticate_user!

  def new
      @user = User.new
    end

    def create

      @user = User.new(user_params)



       if @user.save
         flash[:notice] = "Welcome to Blocitoff #{@user.name}!"
         create_session(@user)
         redirect_to root_path
       else
         flash.now[:alert] = "There was an error creating your account. Please try again."
         render :new
       end
     end





    def confirm

        

        @user = User.new(user_params)



       end
   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end

   def show
     @user = current_user
     @items = @user.items
   end

   private

   def user_params
     params.require(:user).permit(:name)
   end


end
