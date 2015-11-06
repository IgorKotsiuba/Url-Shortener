class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :plan_id
      t.integer :user_id
      t.string :email
      t.string :paypal_customer_token
      t.string :paypal_recurring_profile_token

      t.timestamps null: false
    end
  end
end
