class AddNameAndFavoriteGame < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, default: '', null: false
    add_column :users, :favorite_game, :string, default: '', null: false
  end
end
