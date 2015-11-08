class AddColumnsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :min_numb_links, :integer
    add_column :plans, :max_numb_links, :integer
  end
end
