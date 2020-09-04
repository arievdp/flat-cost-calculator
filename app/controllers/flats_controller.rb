class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @group = Group.new
    @flat.save!
    redirect_to flats_path
  end

  def edit; end

  def update
    # raise
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    @user = current_user
  end

  def flat_params
    params.require(:flat).permit(:title, :address, user_ids: [])
  end
end