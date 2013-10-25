class AddMoneyToUsers < ActiveRecord::Migration
  def change
    add_money :users, :money_total
  end
end
