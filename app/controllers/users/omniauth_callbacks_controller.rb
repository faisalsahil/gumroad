class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def mailchimp

  
   puts "========================================================="
   puts params
   #  @user = User.find_for_mailchimp_oauth(request.env["omniauth.auth"], current_user)
   #  if @user.persisted?
   #    puts "===========1111111111111111111111111111111111111111111111111111"
   #    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Mailchimp"
   #    sign_in(@user)     #//////////////////////  autologin here in devise
   #    redirect_to plans_path, :event => :authentication
   #  else
   #    puts "=====================222222222222222222222222222222222222222222222"
   #    session["users.mailchimp_data"] = request.env["omniauth.auth"]
   #    redirect_to new_user_registration_url
   #  end
  end

  def bigcommerce
    puts "ddd"*90
    puts params
  end
end
