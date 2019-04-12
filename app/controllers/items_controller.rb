class ItemsController < ApplicationController

  def new
  @user = User.find(params[:user_id])
  @item = Item.new
end




    def create
	    # @user = User.find(params[:user_id])
	    # @item = Item.new(item_params)
      # @items = @user.items
     @item = current_user.items.build(item_params)
    #  @item.user = @user
    #  @new_item = Item.new

     if @item.save
       flash[:notice] = "Your item was saved."
     else
       flash[:error] = "There was an error saving your item."
     end
     redirect_to current_user
	  end

    def destroy
      @item = Item.find(params[:id])
      if @item.destroy
        flash[:success] = "This is a flash message"
      else
        flash[:error] = "Something went wrong."
      end
    end


	  private

	  def item_params
	    params.require(:item).permit(:name, :body)
	  end
	end
