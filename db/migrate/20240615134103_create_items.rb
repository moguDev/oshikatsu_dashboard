class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :oshi
      t.date :start_date
      t.date :end_date
      t.string :locate
      t.string :url
      t.boolean :ticket
      t.boolean :deposit
      t.boolean :preparation
      t.integer :user_id

      t.timestamps
    end
  end
end
