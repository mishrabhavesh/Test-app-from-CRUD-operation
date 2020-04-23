class CitiesController < ApplicationController
	def index
		@city= City.all
	end

	def new
			@city = City.new
	end

	def create
	@city = City.new(city_params)
	if @city.save 
	flash[:notice]= "city created"
	redirect_to city_path(@city) 
	else
		render 'new'
	end
	end

	def show
		@city=City.find(params[:id])
	end

	def edit 
		@city = City.find(params[:id])
	end

	def update
		@city = City.find(params[:id])
		if @city.update(city_params)
			flash[:notice]= "city was updated"
			redirect_to city_path(@city)
		else
			render 'new'
		end
	end

	def destroy
		@city = City.find(params[:id])
		@city.destroy
		flash[:notice]= "city deleted successfully"
		redirect_to cities_path
	end


	private 
	def city_params
	params.require(:city).permit(:name)
	end

end