class ItemsController < ApplicationController
	helper_method :params

	def index
		@items = Item.all
	end

	def new
		@item = Item.new 
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to items_path
		else
			
			render :new
		end
	end

	def edit
		find_item_id
	end

	def update
		
		find_item_id
		@item.update(params.require(:item).permit(:name, :category, :price))
	  redirect_to items_path
	end

	def destroy
		find_item_id
		if @item
			@item.destroy
			redirect_to items_path
		end
	end

  private

  	def find_item_id
  		@item = Item.find(params[:id])
  	end


	def item_params
	  params.require(:item).permit(:name, :category, :price)
	end
end
