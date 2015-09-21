require 'mandrill'

class UserMailer < ActionMailer::Base
  default from: "zaeem@chimpchamp.com"

  def billing_warning(user, day)
    @days = day
    @user = user

    if (day < 14)
      subject = "URGENT: Action Required"
    else
      subject = "URGENT: Account Suspended"
    end
    #mail(:to => @user.email, :subject => subject)


    puts "=============>"
    puts "=============>"
    
    m = Mandrill::API.new 'OCnumMSfJOSYVTFonjBOoQ'
    #puts m.templates.list.name

    puts "=============>"
    puts "=============>"


    rendered = m.templates.render 'ableform-notifications', [{:name => "std_content00", :content => "The main content block"}]
    puts rendered['html'] # print out the rendered HTML

    #email_text =  "user_mailer/billing_warnint"
    #email_html = render 'user_mailer/billing_warning'

    message = {
        :subject=> subject,
        :from_name=> "ChimpChamp",
        :text=> rendered['html'],
        :to=>[
            {
                #:email=> @user.email, 'zaeem.asif@gmail.com'
                :email=> 'zaeem.asif@gmail.com',
                :name =>  "zaeem"
            }
        ],
        :html=>rendered['html'],
        :from_email=>'zaeem@chimpchamp.com'
    }
    sending = m.messages.send message
  end

end
