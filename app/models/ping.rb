class Ping < ActiveRecord::Base
	attr_accessible  :ping,:start_date
	belongs_to :user
end
