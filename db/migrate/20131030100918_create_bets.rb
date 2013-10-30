class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.references :user, index: true
      t.integer :time, null: false
      t.integer :quote_start, null: false
      t.integer :quote_final, null: false
      t.money :amount, null: false

      t.timestamps
    end
  end
end
