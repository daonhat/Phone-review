class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :name
      t.string :description
      t.string :os
      t.string :ram
      t.string :screen
      t.string :pin
      t.string :front_camera
      t.string :back_camera
      t.string :memory
			t.float :rate_score
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
