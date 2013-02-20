class ChangeAssetsModelToPolimorphic < ActiveRecord::Migration
  def change
    add_column :assets, :assetable_id, :integer
    add_column :assets, :assetable_type, :string
    add_index :assets, [:assetable_id, :assetable_type]
  end
end
