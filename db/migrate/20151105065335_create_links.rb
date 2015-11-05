class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :original
      t.string :short
      t.integer :clicks, default: 0
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
