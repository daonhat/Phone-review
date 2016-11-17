class CreateImgs < ActiveRecord::Migration[5.0]
  def change
    create_table :imgs do |t|
      t.string :phone_url
      t.references :phone, foreign_key: true

      t.timestamps
    end
  end
end
