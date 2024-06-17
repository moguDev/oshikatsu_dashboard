class AddTranspotationLodgingToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :transportation, :boolean
    add_column :items, :lodging, :boolean
  end
end
