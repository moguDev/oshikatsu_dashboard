class AddIsPrivateToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :is_private, :boolean
  end
end
