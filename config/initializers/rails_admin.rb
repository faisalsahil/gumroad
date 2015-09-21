# RailsAdmin config file. Generated on August 26, 2013 02:57
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Store', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Action, Field, Group, Integration, Myform, PaymentPlan, PixelTrackHistory, Product, Submission, User, Webhook]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Action, Field, Group, Integration, Myform, PaymentPlan, PixelTrackHistory, Product, Submission, User, Webhook]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Action do
  #   # Found associations:
  #     configure :myform, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :myform_id, :integer         # Hidden 
  #     configure :action, :string 
  #     configure :segment, :string 
  #     configure :grouping, :string 
  #     configure :group, :string 
  #     configure :template, :string 
  #     configure :remove_list, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Field do
  #   # Found associations:
  #     configure :myform, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :myform_id, :integer         # Hidden 
  #     configure :field_type, :string 
  #     configure :choices, :text 
  #     configure :name, :text 
  #     configure :tag, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :req, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Group do
  #   # Found associations:
  #     configure :myform, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :myform_id, :integer         # Hidden 
  #     configure :groupName, :string 
  #     configure :groupid, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Integration do
  #   # Found associations:
  #     configure :user, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :integration_name, :string 
  #     configure :is_active, :boolean 
  #     configure :api_username, :string 
  #     configure :api_token, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Myform do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :fields, :has_many_association 
  #     configure :actions, :has_many_association 
  #     configure :groups, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :listid, :string 
  #     configure :optin, :integer 
  #     configure :welcome, :integer 
  #     configure :msg_type, :string 
  #     configure :msg, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :user_id, :integer         # Hidden 
  #     configure :url, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model PaymentPlan do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :allowedsubscriptions, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model PixelTrackHistory do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer 
  #     configure :form_id, :integer 
  #     configure :ip_address, :string 
  #     configure :status, :string 
  #     configure :email, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Product do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :price, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Submission do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer 
  #     configure :form_id, :integer 
  #     configure :ip_address, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #     configure :myforms, :has_many_association 
  #     configure :integration, :has_one_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :mailchimp_user_id, :string 
  #     configure :mailchimp_api_key, :string 
  #     configure :stripedate, :datetime 
  #     configure :stripetoken, :string 
  #     configure :payment_plan_id, :integer 
  #     configure :signupdate, :datetime 
  #     configure :subscriptioncount, :integer 
  #     configure :user_name, :string 
  #     configure :expired, :string 
  #     configure :fingerprint, :string 
  #     configure :expiry_date, :date 
  #     configure :sent_day, :integer   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Webhook do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :eventtype, :string 
  #     configure :fingerprint, :string 
  #     configure :data, :text 
  #     configure :logs, :text 
  #     configure :misc, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
