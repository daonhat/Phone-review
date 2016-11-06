class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone_number
      t.string :is_admin
      t.string :boolean

      t.timestamps
    end
  end
end
