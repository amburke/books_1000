class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.integer :number
      t.integer :club_id
      t.timestamps null: false
    end
  end
end
