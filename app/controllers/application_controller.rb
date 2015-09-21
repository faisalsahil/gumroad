class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    # dashboard_path
    user_omniauth_authorize_path(:mailchimp)
  end

  def user_authenticate
    #return redirect_to :root_path unless user_signed_in
    if !user_signed_in?
      redirect_to :root
    end
  end

  def credit_card
    unless  current_user.expiry_date.nil?
      @day = (-(current_user.expiry_date - Date.today)) + 1
      if current_user.expiry_date <= Date.today
        if @day < 8
          if current_user.sent_day.nil? || current_user.sent_day == 0
            UserMailer.billing_warning(current_user, @day).deliver
            current_user.sent_day = 1
            current_user.save!
          end
          @msg = "You have gone over your Free account limit. Please upgrade your plan to avoid interruptions to your form submissions."
        elsif @day < 15 && @day > 7
          unless current_user.sent_day == 8
            UserMailer.billing_warning(current_user, @day).deliver
            current_user.sent_day = 8
            current_user.save!
          end
          @msg = "Your account has been over the limit for over 7 days and will be suspended if you don't take immediate action. Please upgrade your plan to avoid interruptions to your form submissions."
        elsif @day > 14
          unless current_user.sent_day == 15
            UserMailer.billing_warning(current_user, @day)
            current_user.sent_day = 15
            current_user.save!
          end
          @msg = "This user account is currently not active. Please visit www.AbleForm.com for more information."
        end
      end
    end
  end
end
