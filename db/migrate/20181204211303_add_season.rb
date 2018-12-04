class AddSeason < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :season, :integer
  end
end
