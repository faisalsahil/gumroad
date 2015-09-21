class Cardinfo < ActiveRecord::Base
	attr_accessible :card_code, :card_number, :charge_id, :token, :user_id, :plan_id
	belongs_to :user
end
