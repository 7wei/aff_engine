class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :source
      t.string :url
      t.bigint "product_id", null: false

      t.timestamps
    end
  end
end
