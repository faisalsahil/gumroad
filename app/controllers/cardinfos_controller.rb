class CardinfosController < ApplicationController
	def new
		@cardinfo = current_user.build_cardinfo
    @plan_id = params[:planid]
		@plans = Plan.all
	end
	def create
		if params[:cardinfo].present?
  	  @c_info = current_user.build_cardinfo(params[:cardinfo])
  		@c_info.save
      num_str = @c_info.card_number
      @last_four = num_str[-4..-1]
      @c_info.card_number = @last_four
      @c_info.card_code = "***"
      @c_info.save
  		flash[:notice] = "you credit card information successfully save."
  		redirect_to new_mapping_path
  	else
  		flash[:error] = "something went wrong."
  		redirect_to :back
  	end
  end

  def edit
  	@cardinfo  = Cardinfo.find(params[:id])
    @plan_id = params[:planid]
    @cardinfo.plan_id = params[:planid]
    if @cardinfo.save
        flash[:notice]="Plan Successfully Upgrade."
        redirect_to plans_path
    else
        flash[:error] = "Something went wrong."
        redirect_to :back
    end
  	
  end

  def update_billing
    @cardinfo  = Cardinfo.find(params[:id])
  end

  def update
    @cardinfo  = Cardinfo.find(params[:id])
    @plan_id = @cardinfo.plan_id
    if @cardinfo.update_attributes(params[:cardinfo])
      @cardinfo.plan_id = @plan_id
      num_str = @cardinfo.card_number
      @last_four = num_str[-4..-1]
      @cardinfo.card_number = @last_four
      @cardinfo.card_code = "***"
      @cardinfo.save
      flash[:notice]="Successfully Update."
      redirect_to  plans_path
    else
      flash[:error] = "Please choose one option."
      redirect_to :back
    end
  end

  def show
    @cardinfo  = Cardinfo.find(params[:id])
  end
end

# end
