class AddUserIdApiKeyToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :mailchimp_user_id, :string
  	add_column :users, :mailchimp_api_key, :string
    add_column :users,:stripedate, :datetime
    add_column :users,:stripetoken, :string
    add_column :users, :payment_plan_id, :integer
    add_column :users,:signupdate, :datetime
    add_column :users,:subscriptioncount, :integer


  end

  def self.down
    remove_column :users, :mailchimp_user_id
    remove_column :users, :mailchimp_api_key
    remove_column :users, :stripedate
    remove_column :users, :stripetoken
    remove_column :users, :payment_plan_id
    remove_column :users, :signupdate
    remove_column :users, :subscriptioncount

  end
end
