task :Ping =>:environment do
   puts "=======================   Pings charge =================="
   require 'stripe'
   Stripe.api_key = "sk_test_cWbI1fA0O5evvorlsXuD4C23"
   # @date = DateTime.now
   @today_date = Date.today
   # @user = User.where("ping >= ?", 25)
   # ////////////////// test ////////////////////
   # @user = User.last
   # @ping = @user.ping
   # if @ping.start_date < @today_date
   #     puts "database date is less"
   # else
   #   puts "database date is greater"
   # end
  # //////////////////////////////////////////////
   @plans = Plan.all
     if @plans.present?
         @plans.each do |plan|
           # @user = User.where("ping >= ?", plan.ping_count)
           @pings = Ping.where("ping = ?", plan.ping_count)
           # @pings = Ping.all
           if @pings.present?
                 @pings.each do |ping|
                   @ping_date = ping.start_date+ 1.month
                   if @ping_date <= @today_date
                     response = Stripe::Charge.create(
                       :amount => plan.ping_charges,
                       :currency => "usd",
                       :card => ping.user.cardinfo.token, # obtained with Stripe.js
                       :description => ping.user.email,
                       :capture => true
                     )
                     if response["paid"] == true
                         @charging = Charging.new
                         @charging.user_id = ping.user.id
                         @charging.start_date = ping.start_date
                         @charging.charged_date = @today_date
                         @charging.pings = ping.ping
                         if @charging.save
                            Ping.find(ping.id).destroy
                         end
                     else
                       # ========== block count here ==================

                     end
                   end #end of if
                 end # end of user loop
           else
             puts "********************"
             puts "Ni mila"
           end # end of if
         end # end of plan loop
     end  #end of if

end# end of environment