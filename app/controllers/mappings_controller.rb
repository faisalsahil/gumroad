class MappingsController < ApplicationController

	def new
		if current_user.present?
			@mapping = current_user.build_mapping
		    @api_key = current_user.mailchimp_api_key
		    gb = Gibbon::API.new(@api_key)
		    Gibbon::API.api_key = @api_key
		    Gibbon::API.timeout = 15
		    Gibbon::API.throws_exceptions = false

		    # ------------load lists--------------

		      @lists = Gibbon::API.lists.list
		    if @lists["status"] == "error"
		        puts "error"
		        flash[:error]="Sorry! Please Enter Correct Api Key."
		        redirect_to :back
		    else
		        @listloaded = []
		        @lists['data'].each_with_index do |list, index|
		          @listloaded[index] = {}
		          @listloaded[index]["id"] = list["id"]
		          @listloaded[index]["name"] = list["name"]
		        end
		    end
		    if params.present?
	           @merge_vars = params[:mergeVars]
	           @listId = params[:listid]
	        end
		end
	end

	def load_merge_vars
		@api_key = current_user.mailchimp_api_key
		@list_id = params[:listid]
		gb = Gibbon::API.new(@api_key)
		Gibbon::API.api_key = @api_key
		Gibbon::API.timeout = 15
		Gibbon::API.throws_exceptions = false
		@mergs = Gibbon::API.lists.merge_vars(:id=>[@list_id])
		puts "***************************************************"
		puts @mergs.inspect
		 if @mergs["status"] == "error"
		    puts "error"
		    flash[:error]="Sorry! Please Enter Correct Api Key."
		    redirect_to :back
		else
		    @merge_vars = []
		    @data = []
		    @aa = []
		    @data = @mergs["data"]
		    @aa = @data[0]["merge_vars"]
		    puts "000000000000000000000 data 00000000000000000000000000000000000000"
		    puts @data
		    puts "00000000000000000000 aa 00000000000000000000000000000000000000000"
		    puts @aa
			@aa.each_with_index do |var,index|
				@merge_vars[index] = {}
		    	@merge_vars[index]["name"] = var["name"]
		    	@merge_vars[index]["tag"] = var["tag"]
		    end
        redirect_to new_mapping_path({:mergeVars => @merge_vars, :listid => @list_id})
		end
		puts ")00000000000000000000000000000000000000000000000000000000000("
		puts @merge_vars .inspect
	end

	def create
	    @mapping = current_user.build_mapping(params[:mapping])
	    if @mapping.save!
	      flash[:notice] = "Successfully save."
	      @ping = Ping.find_by_user_id(current_user.id)
	      	redirect_to mapping_path(@mapping)
	    else
	      flash[:error] = "Something went wrong."
	      redirect_to :back
	    end
	end

	def show
	   @mapping = Mapping.find(params[:id])
	end

	def edit
	    @mapping = Mapping.find(params[:id])
	    @api_key = current_user.mailchimp_api_key
		    gb = Gibbon::API.new(@api_key)
		    Gibbon::API.api_key = @api_key
		    Gibbon::API.timeout = 15
		    Gibbon::API.throws_exceptions = false

		    # ------------load lists--------------

		      @lists = Gibbon::API.lists.list
		    if @lists["status"] == "error"
		        puts "error"
		        flash[:error]="Sorry! Please Enter Correct Api Key."
		        redirect_to :back
		    else
		        @listloaded = []
		        @lists['data'].each_with_index do |list, index|
		          @listloaded[index] = {}
		          @listloaded[index]["id"] = list["id"]
		          @listloaded[index]["name"] = list["name"]
		        end
		    end
		# ======================================================================
		@listId = current_user.mapping.list_id
		@mergs = Gibbon::API.lists.merge_vars(:id=>[@listId])
		 if @mergs["status"] == "error"
		    flash[:error]="Sorry! Please Enter Correct Api Key."
		    redirect_to :back
		else
		    @merge_vars = []
		    @data = []
		    @aa = []
		    @data = @mergs["data"]
		    @aa = @data[0]["merge_vars"]
			@aa.each_with_index do |var,index|
				@merge_vars[index] = {}
		    	@merge_vars[index]["name"] = var["name"]
		    	@merge_vars[index]["tag"] = var["tag"]
		    end
		end
	end

	def update
	    @mapping = Mapping.find(params[:id])
	    if @mapping.update_attributes(params[:mapping])
	      flash[:notice]="Successfully Update."
	      redirect_to  mapping_path(@mapping)
	    else
	      flash[:error] = "Please fill all fields."
	      redirect_to :back
	    end
	end

end
