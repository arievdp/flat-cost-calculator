class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
    @invitation = @flat.invitations.where(invited_by: current_user).last
    @balance_per_flatmate = @flat.balance / @flat.users.count
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params.slice(:title, :address))
    @flat.save!
    @group = Group.new
    @group.user = User.find(flat_params[:user_id])
    @group.flat = @flat
    @group.save!
    redirect_to flat_path(@flat)
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
    params.require(:flat).permit(:title, :address, :user_id)
  end
end
