class CreateAltons < ActiveRecord::Migration[7.0]
  def change
    create_table :altons do |t|
      t.string :name
      t.date :data
      t.string :car
      t.text :description

      t.timestamps
    end
  end
end
