class Utility < ActiveRecord::Base
  has_attached_file :avatar,
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename",
  :styles => {:thumb => "191x126#" }
end
