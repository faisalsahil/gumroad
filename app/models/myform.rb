# include Mandrill
class Myform < ActiveRecord::Base




  attr_accessible :name, :actions_attributes, :groups_attributes ,:fields_attributes, :listid, :msg, :optin, :welcome, :msg_type, :user_id, :url


  has_many :fields, :dependent => :destroy
  accepts_nested_attributes_for :fields, :allow_destroy => true, :reject_if => :all_blank

  has_many :actions, :dependent => :destroy
  accepts_nested_attributes_for :actions, :allow_destroy => true, :reject_if => :all_blank

  has_many :groups, :dependent => :destroy
  accepts_nested_attributes_for :groups, :allow_destroy => true, :reject_if => :all_blank


  validates_presence_of :name
  validates_presence_of :listid
end
