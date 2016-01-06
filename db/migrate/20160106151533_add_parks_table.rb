class AddParksTable < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :title ,  null: false
      t.string :location ,  null: false
      t.float :rating,  null: false

      t.boolean :bathroom
      t.boolean :picnic
      t.boolean :pets
      t.boolean :basketball
      t.boolean :baseball

      t.timestamps null: false
    end
  end
end
