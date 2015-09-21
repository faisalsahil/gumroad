class HomeController < ApplicationController


	def show
		puts "==============Home/show===================================="
  		# redirect_to user_omniauth_authorize_path(:mailchimp) unless user_signed_in?
      
      redirect_to user_omniauth_authorize_path(:bigcommerce) unless user_signed_in?
      
  	end
end
