class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.string :title
      t.text :plot
      t.integer :season_nb

      t.timestamps
    end
  end
end
