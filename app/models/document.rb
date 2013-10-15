class Document < ActiveRecord::Base
  has_attached_file :doc_image,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
end
