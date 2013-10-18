class CreateTraderooms < ActiveRecord::Migration
  def change
    create_table :traderooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
