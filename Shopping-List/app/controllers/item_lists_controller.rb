class ItemListsController < ApplicationController

	def new 
		@item_list = ItemList.new
		@items = Item.all
		@lists = List.all
	end

	def create
		
		@item_list = current_user.lists[item_list_params[:list_id].to_i-1].item_lists.build(item_list_params)
		
		if @item_list.save
			redirect_to user_list_path(item_list_params[:list_id].to_i)
		else
			render :new
		end

	end

	private

	def item_list_params
	  params.require(:item_list).permit(:quantity, :list_id, :item_id)
	end
end
