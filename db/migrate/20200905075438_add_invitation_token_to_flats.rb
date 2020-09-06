class AddInvitationTokenToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :invitation_token, :string
    add_column :flats, :invited_by, :integer
  end
end
