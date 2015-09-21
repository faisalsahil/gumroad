class BillingsController < ApplicationController

	def index
		@cardinfo = current_user.cardinfo
		
		# if @cardinfo.blank?
			# @cardinfo = current_user.build_cardinfo
		# end
	end
end
