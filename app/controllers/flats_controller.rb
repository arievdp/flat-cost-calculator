class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.select { |f| f.users.include?(current_user) }
  end

  def show
    @invitation = @flat.invitations.where(invited_by: current_user).last
    transactions = []
    @flat.transactions.each { |t| transactions << t.amount }
    @transactions_total = transactions.inject(:+)
    @transactions_total = 0 if @transactions_total.nil?
    users = @flat.users
    n_flatmates = users.count
    balance_per_flatmate = @transactions_total / n_flatmates

    users.each do |u|
      u.balance = (balance_per_flatmate - u.calculate_balance(@flat.id))
    end

    sorted_users = users.sort_by(&:balance)
    sum = 0
    # sorted_users.each do |u|
    #   break if sorted_users.select { |ub| ub.balance.negative? }.count.zero?

    #   if u == sorted_users.first && u.balance.negative?
    #     sum = (u.balance / (n_flatmates - 1))
    #     u.balance = 0
    #     sorted_users.each do |ub|
    #       (ub.balance += -sum) if ub != u
    #     end
    #   elsif u.balance.negative?
    #     positive_users = sorted_users.select { |ub| ub.balance >= 0 }
    #     sum = (u.balance / positive_users.count)
    #     u.balance = 0
    #     positive_users.each do |ub|
    #       ub.balance += -sum
    #     end
    #   end
    # end
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
