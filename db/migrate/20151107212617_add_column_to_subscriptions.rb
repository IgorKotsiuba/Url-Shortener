class AddColumnToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :link_count, :integer
  end
end
