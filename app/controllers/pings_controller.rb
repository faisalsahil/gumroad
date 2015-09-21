class PingsController < ApplicationController

	def show
		puts "=================ping show==============================="
		@ping = Ping.find(params[:id])
		@cardinfo  = current_user.cardinfo
		if @cardinfo.present?
			@plan = Plan.find_by_id(@cardinfo.plan_id)
			@ping_count = @plan.ping_count
		end
	end

	def gum_request
	    if params.present?
	      @user = User.find(params[:user_id])
	      # @user = User.find_by_id(3)
	      if @user && @user.mckey.present?
	        @ping = Ping.find_by_user_id(@user)
	        if @ping.blank?
	          @ping = current_user.build_ping
	        end
	        @ping = @ping.ping+1
	        @ping.save! 
	        @mckey = @user.mckey
	        if @mckey.try(:apisetting).try(:present?)
	          # subscribe user here
	          @apisetting = @mckey.apisetting
	          @order_number = params[:order_number]
	          @seller_id = params[:seller_id]
	          @product_id = params[:product_id]
	          @product_link = params[:product_permalink]
	          @email = params[:email]
	          @name = params[:full_name]
	          @price = params[:price]
	          @variant =  params[:variant][:id] rescue nil
	          @code = params[:offer_code]
	          @test = params[:test]
	          @fields = params[:custom_fields][:required] rescue nil # question here
	          @shipping_info = params[:shipping_information]
	          @rec_charge = params[:is_recurring_charge]
	          @pre_auth = params[:is_preorder_authorization]
	          # @order_number = 1234;
	              # =========== subscribe here =====================
	              gb = Gibbon::API.new(@mckey.key)
	              Gibbon::API.api_key = @mckey.key
	              Gibbon::API.timeout = 15
	              Gibbon::API.throws_exceptions = false
	              flag = Gibbon::API.lists.subscribe(:id =>  @mckey.list_id,
	                      :email => {:email => @apisetting.email},
	                      :merge_vars=>{"#{@apisetting.order_number}"=>@order_number,
	                              "#{@apisetting.seller_id}"=>@seller_id,
	                              "#{@apisetting.product_id}"=>@product_id,
	                              "#{@apisetting.product_permalink}"=>@product_link,
	                              "#{@apisetting.full_name}"=>@name,
	                              "#{@apisetting.price}"=>@price,
	                              "#{@apisetting.variants}"=>@variant,
	                              "#{@apisetting.offer_code}"=>@code,
	                              "#{@apisetting.test}"=>@test,
	                              "#{@apisetting.custom_fields}"=>@fields,
	                              "#{@apisetting.shipping_information}"=>@shipping_info,
	                              "#{@apisetting.is_recurring_charg}"=>@rec_charge,
	                              "#{@apisetting.is_preorder_authorization}"=>@pre_auth
	                            },
	                      :double_optin   => false,
	                      :update_existing=> true
	                      )
	              if !defined?(flag.status)
	                puts "============== subscribe successfully ================"
	              else
	                puts "=============== Not Unsubscribe. ======================"
	              end
	        end
	      end
	    end
    end
end
