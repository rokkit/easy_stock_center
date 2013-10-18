class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name, null: false
      t.string :avatar
      t.references :traderoom, null: false

      t.timestamps
    end
  end
end
