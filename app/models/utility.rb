class Utility < ActiveRecord::Base
  has_attached_file :utility_image,
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename",
  :styles => {:thumb => "191x126#" }
end
