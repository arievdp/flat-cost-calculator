class ChangeBalanceToFloat < ActiveRecord::Migration[6.0]
  def change
    remove_column :flats, :balance, :string
    add_column :flats, :balance, :float
  end
end
