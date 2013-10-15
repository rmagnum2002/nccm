class Image < ActiveRecord::Base
  has_attached_file :photo,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
end
