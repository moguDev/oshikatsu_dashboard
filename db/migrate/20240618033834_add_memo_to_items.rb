class AddMemoToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :memo, :string
  end
end
