class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show]
  def new
    i = Invitation.new(invitation_params)
    i.flat = Flat.find(invitation_params[:flat_id])
    i.save!
    redirect_to flat_path(i.flat)
  end

  def show
    if @invitation.flat.user_ids.include?(current_user.id)
      flash[:notice] = 'You are already a part of this flat'
      redirect_to flat_path(@invitation.flat_id)
    else
      @invited_by = User.find(@invitation.invited_by)
    end
  end

  private

  def set_invitation
    @invitation = Invitation.find_by(token: params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:id, :flat_id, :invited_by, :token)
  end
end
