class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.text :ends_at
      t.text :reserve_price
      t.timestamps
    end
  end
end
