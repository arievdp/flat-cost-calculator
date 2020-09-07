class AddBalanceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :balance, :float
  end
end
