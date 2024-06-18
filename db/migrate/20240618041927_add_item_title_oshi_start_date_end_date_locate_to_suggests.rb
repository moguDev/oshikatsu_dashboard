class AddItemTitleOshiStartDateEndDateLocateToSuggests < ActiveRecord::Migration[7.1]
  def change
    add_column :suggests, :item_title, :string
    add_column :suggests, :oshi, :string
    add_column :suggests, :start_date, :date
    add_column :suggests, :end_date, :date
    add_column :suggests, :locate, :string
  end
end
