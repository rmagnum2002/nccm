class Service < ActiveRecord::Base
  def content_for_locale(lang)
    if lang == 'en'
      self.title
    elsif lang == "ru"
      self.title_ru
    else
      self.title_ro
    end
  end
end
