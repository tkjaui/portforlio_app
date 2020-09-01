class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.integer :user_id
      t.string :title
      t.string :company
      t.string :device
      t.text :problem
      t.string :price
      t.string :days
      t.string :result
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
