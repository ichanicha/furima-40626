class CreateOders < ActiveRecord::Migration[7.0]
  def change
    create_table :oders do |t|

      t.timestamps
    end
  end
end
