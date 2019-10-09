class CreateScouts < ActiveRecord::Migration[6.0]
  def change
    create_table :scouts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :introduction
      t.string :active_week
      t.string :mm_rank
      t.integer :pugs_elo
      t.string :active_time
      t.string :playstyle
      t.string :role
      t.string :active_range
      t.string :image
      t.integer :scout_flg

      t.timestamps
    end
  end
end
