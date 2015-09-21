class DashboardController < ApplicationController
  def index
  	@plans = Plan.all
  	@cardinfo  = current_user.cardinfo
  	@ping = Ping.find_by_user_id(current_user.id)
    if @cardinfo.present?
      @plan = Plan.find_by_id(@cardinfo.plan_id)
      if @plan.present?
        @ping_count = @plan.ping_count
      end
    	# num_str = @cardinfo.card_number
   	 	# @last_four = num_str[-4..-1]
    	
    end
    @uid = current_user.id
    @hostname = request.host
    render :layout=>"application"
  end
end
