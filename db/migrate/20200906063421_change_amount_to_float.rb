class ChangeAmountToFloat < ActiveRecord::Migration[6.0]
  def self.up
    change_column :transactions, :amount, "float USING amount::double precision"
  end

  def self.down
    change_column :transactions, :amount, :string
  end
end
