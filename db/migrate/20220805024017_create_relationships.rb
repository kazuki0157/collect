class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :item, foreign_key: true
      t.references :trade_item, foreign_key: { to_table: :items }

      t.timestamps

      t.index [:item_id, :trade_item_id], unique: true
    end
  end
end
