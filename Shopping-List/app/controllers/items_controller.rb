class ItemsController < ApplicationController
	before_action :find_item_id, only: [:show, :edit, :update, :destroy]
	helper_method :params

	def index
		@items = Item.all
		respond_to do |f|
			f.html {render :index}
			f.json {render json: @items}
		end
	end

	def show
		respond_to do |f|
			f.html {render :show}
			f.json {render json: @item}
		end
	end

	def new
		@item = Item.new 
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			respond_to do |f|
				f.html {redirect_to items_path}
				f.json {render json: @item}
			end
		else
			render :new
		end
	end

	def edit
		find_item_id
	end

	def update
		
		find_item_id
		@item.update(item_params)
		respond_to do |f|
				f.html {redirect_to items_path}
				f.json {render json: @item}
		end
	  # redirect_to items_path
	end

	def destroy
		find_item_id
		if @item
			@item.destroy
			respond_to do |f|
				f.html {redirect_to items_path}
				f.json {head :no_content}
			end
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
