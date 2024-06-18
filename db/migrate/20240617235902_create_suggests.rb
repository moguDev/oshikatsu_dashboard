class CreateSuggests < ActiveRecord::Migration[7.1]
  def change
    create_table :suggests do |t|
      t.string :title
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
