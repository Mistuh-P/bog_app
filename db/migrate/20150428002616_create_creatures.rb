class CreateCreatures < ActiveRecord::Migration
  def change
    create_table :creatures do |t|
      t.text :name
      t.text :desc

      t.timestamps null: false
    end
  end
end
