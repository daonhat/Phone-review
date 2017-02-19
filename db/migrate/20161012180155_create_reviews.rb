class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.float :rate_review
      t.references :user, foreign_key: true
      t.references :phone, foreign_key: true

      t.timestamps
    end
  end
end
