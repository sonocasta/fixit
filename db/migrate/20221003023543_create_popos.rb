class CreatePopos < ActiveRecord::Migration[7.0]
  def change
    create_table :popos do |t|
      t.string :name
      t.date :date
      t.string :car
      t.text :description
      t.integer :phone

      t.timestamps
    end
  end
end
