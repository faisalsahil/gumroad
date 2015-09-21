class Mapping < ActiveRecord::Base

attr_accessible :list_id,:list,:order_number,:order_number,:seller_id, :product_id,:product_permalink,:email, :full_name, :price,:variants, :offer_code, :test, :custom_fields, :shipping_information,:is_recurring_charge, :is_preorder_authorization,:user_id
# validates_presence_of :order_number,:order_number,:seller_id, :product_id,:product_permalink,:email, :full_name, :price,:variants, :offer_code, :test, :custom_fields, :shipping_information

belongs_to :user
end
