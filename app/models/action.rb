class Action < ActiveRecord::Base
  attr_accessible :action, :myform_id, :list, :grouping, :group, :template, :segment, :remove_list
  belongs_to :myform
end
