class RestaurantsController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show, :new, :create]

	def new
		@rest = Restaurant.new
	end

	def destroy
		@rest = Restaurant.find(params[:id])
		@rest.destroy

		redirect_to restaurants_path
	end

	def edit
		@rest = Restaurant.find(params[:id])
	end

	def show
		@rest = Restaurant.find(params[:id])
	end

	def create
		@rest = Restaurant.new(params[:restaurants])

		if @rest.save
			redirect_to @rest
		else
			render 'new'
		end
	end

	def index
		@rest = Restaurant.all
	end 

	def update
		@rest = Restaurant.find(params[:id])
		if @rest.update(params[:restaurant].permit(:name, :description, :adress, :phone_number))
			redirect_to @rest
		else
			render 'edit'
		end
	end

	# private
	# 	def post_params
	# 		params.require(:post).permit(:name, :description, :address, :phone_number)
	# 	end


end
