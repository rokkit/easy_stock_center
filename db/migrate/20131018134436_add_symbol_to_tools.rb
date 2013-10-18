class AddSymbolToTools < ActiveRecord::Migration
  def change
    add_column :tools, :symbol, :string
  end
end
