class User < ActiveRecord::Base
  # Include default users modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible  :email, :password, :mailchimp_user_id, :mailchimp_api_key, :password_confirmation, :remember_me, :user_name, :payment_plan_id, :signupdate, :subscriptioncount, :stripetoken, :fingerprint
  validates_presence_of :user_name
  # validates_uniqueness_of :user_name
  has_one :cardinfo
  has_one :mapping
  has_one :ping
attr_accessible :user_type, :email, :password

  def self.find_for_mailchimp_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info.to_hash
    dc = access_token.extra.metadata.to_hash["dc"]
    token = access_token.credentials.to_hash["token"]
    api_key = "#{token}-#{dc}"
    user_name = data["contact"]["company"]
    email =  data["contact"]["email"]
    domain = email.split("@").last

    puts "==>"
    puts data.inspect

    mailchimp_user_id = data["user_id"]
    name = "#{data['contact']['fname']} #{data['contact']['lname']}"
    password = Devise.friendly_token[0,20]

    user = User.where(:mailchimp_user_id => mailchimp_user_id).first
    if user
      user.user_name = user_name
      user.email = email
      user.mailchimp_api_key = api_key
      user.save
    else
      user = User.where(:email => email).first
      if user
        user.user_name = user_name
        user.mailchimp_user_id = mailchimp_user_id
        user.mailchimp_api_key = api_key
        user.save
      else
        if domain == "chimpchamp.com" || domain == "ChimpChamp.com"
          user = User.create!(
              :mailchimp_user_id => mailchimp_user_id,
              :email => email,
              :user_name => user_name,
              :password => password,
              :mailchimp_api_key => api_key,
              :payment_plan_id => 0,
              :signupdate => Time.now,
              :subscriptioncount => 100,
              :user_type => "admin"
          )
        else
          user = User.create!(
              :mailchimp_user_id => mailchimp_user_id,
              :email => email,
              :user_name => user_name,
              :password => password,
              :mailchimp_api_key => api_key,
              :payment_plan_id => 0,
              :signupdate => Time.now,
              :subscriptioncount => 100
          )
        end
      end
    end
    return user
  end



end

