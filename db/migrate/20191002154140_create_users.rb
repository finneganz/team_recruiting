class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :introduction
      t.string :active_week
      t.string :rank
      t.string :active_time
      t.string :playstyle
      t.string :role
      t.string :active_range
      t.string :image
      t.integer :is_deleted
      t.integer :scout_flg

      t.timestamps
    end
  end
end
