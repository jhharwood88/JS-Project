class ListsController < ApplicationController

	before_action :authenticate_user!

	def index 
		@current_user_list = current_user.lists
	end

	def show 
		@list = List.find(params[:id])

		

		# console to add an item to item_list 
		# @list.item_lists.build(quantity: 5, item_id: 1, list_id: 1)
	end

	def new
		@list = List.new 
		@list.user = current_user
		
	end

	def create
		@list = current_user.lists.build(list_params)
		if @list.save
			redirect_to user_list_path([@list.user,@list])
		else
			render :new
		end
	end

private

	def list_params
	  params.require(:list).permit(:name)
	end

end
