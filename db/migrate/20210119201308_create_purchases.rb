class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :purchase_option, null: false
      t.references :user, null: false
      t.string :content

      t.timestamps
    end
  end
end
