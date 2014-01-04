class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
    @owners = Owner.all
  end

  def show
    set_building
  end

  def edit
    set_building
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to building_path(@building), notice: "Building successfully added!"
    else
      render :new
    end
  end

  def update
    @building = Building.new(building_params)

    if @building.update(building_params)
      redirect_to building_path(@building), notice: "Building successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    set_building.destroy
    redirect_to buildings_path, notice: "Building successfully removed!"
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:street_address, :city, :state, :zipcode, :description, :owner_id)
  end

end
