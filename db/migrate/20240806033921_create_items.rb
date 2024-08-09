class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false, default: ""
      t.text :description,           null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :shopping_charge_id, null: false
      t.integer :prefecture_id,      null: false
      t.integer :daily_id,           null: false
      t.integer :price,              null: false, default: 0
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
