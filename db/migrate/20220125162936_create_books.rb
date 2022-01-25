class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.integer :released_year
      t.float :price
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
