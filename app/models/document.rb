class Document < ActiveRecord::Base
  has_attached_file :doc_image,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  def title_for(lang)
    if lang == 'en'
      self.title
    elsif lang == "ru"
      self.title_ru
    else
      self.title_ro
    end
  end
end
