class CreateBuyaddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :buyaddresses do |t|

      t.timestamps
    end
  end
end
