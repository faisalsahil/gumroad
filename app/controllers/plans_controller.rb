class PlansController < ApplicationController
require 'stripe'

	def show
		@plans = Plan.find(params[:id])
	end

	def index
		@plans = Plan.all(:order => "ping_charges ASC")
		if @plans.first.blank?
			if current_user && current_user.user_type == "admin"
			  flash[:notice] = "There is no plan saved.Please enter plan first."
			  redirect_to new_plan_path
			else
				redirect_to dashboard_path
			end
		elsif current_user.cardinfo.present?
			@cardinfo = current_user.cardinfo
		end
	end

	def new
		if current_user && current_user.user_type == "admin"
			@plan = Plan.new
		else
			flash[:notice] = "Permission denied!"
			redirect_to :back
		end
	end

	def create
		if current_user && current_user.user_type == "admin"
			@plan = Plan.new(params[:plan])
			if @plan.valid?
				require 'stripe'
		   		Stripe.api_key = "sk_test_cWbI1fA0O5evvorlsXuD4C23"
		   		response = Stripe::Plan.create(
		                       :amount => params[:plan][:ping_charges],
		                       :currency => "usd",
		                       :interval => "month",
		                       :name => params[:plan][:ping_count],
		                       :id => params[:plan][:unique_id]
		                    )

				# @plan = Plan.new(params[:plan])
				@plan.save
				flash[:notice] = "successfully save."
				redirect_to plans_path
			else
				flash[:error] = "Please Fill All Fields."
				redirect_to :back
			end
		else

		end
	end

	def edit
		@plan = Plan.find(params[:id])
	end

	def update
		@plan = Plan.find(params[:id])
		@plan.update_attributes(params[:plan])
		flash[:notice] = "Plan successfully update."
		redirect_to plans_path
	end

	def destroy
		@plan = Plan.find(params[:id])
		@cardinfo = current_user.cardinfo
		if @cardinfo.present?
			if @cardinfo.plan_id == @plan.id
				@cardinfo.plan_id = ''
				@cardinfo.save
			end
		end
   		@plan.destroy
   		flash[:notice] = "Successfully destroy."
   		redirect_to plans_path
	end

	def aaaa
		require 'stripe'
		Stripe.api_key = "sk_test_cWbI1fA0O5evvorlsXuD4C23"
		response = Stripe::Plan.all

		puts "==========================================================="
		puts response.inspect
		response1 = Stripe::Charge.all
		puts
		puts
		puts
		puts "==========================================================="
		puts response1
	end
end

