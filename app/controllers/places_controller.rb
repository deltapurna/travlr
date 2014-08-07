class PlacesController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @places = Place.all

    respond_to do |format|
      format.html
      format.json { render json: @places, status: :ok }
    end
  end
  
  def show
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @place }
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params.require(:place).permit(:name, :latitude, :longitude))

    respond_to do |format|
      if @place.save
        format.html { redirect_to root_path, notice: "Place successfully created!" }
        format.json { render nothing: true, status: 201 }
      else
        format.html { render :new }
        format.json { render json: @place.errors }
      end
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update(params.require(:place).permit(:name, :latitude, :longitude))
        format.html { redirect_to root_path, notice: "Place is successfully updated!" }
        format.json { render json: @place }
      else
        format.html { render :edit }
        format.html { render json: @place.errors }
      end
    end
  end

  def destroy
    Place.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Place successfully deleted" }
      format.json { render json: "Place successfully deleted" }
    end
  end
end
