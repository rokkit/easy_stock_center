class AddToolsToBets < ActiveRecord::Migration
  def change
    add_column :bets, :tool_id, :integer
  end
end
