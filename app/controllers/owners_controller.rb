class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def show
    set_owner
  end

  def edit
    set_owner
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to owner_path(@owner), notice: "Owner successfully added!"
    else
      render :new
    end
  end

  def update
    @owner = Owner.new(owner_params)

    if @owner.update(owner_params)
      redirect_to owner_path(@owner), notice: "Owner successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    set_owner.destroy
    redirect_to owners_path, notice: "Owner successfully removed!"
  end

  private

  def set_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company_name)
  end
end