class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.integer :price,              null: false
      t.string :item_description,    null: false
      t.string :category,            null: false
      t.references :user,            foreign_key: true


      t.timestamps
    end
  end
end
