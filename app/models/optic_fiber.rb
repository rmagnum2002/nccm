class OpticFiber < ActiveRecord::Base
  def content_for_locale(lang)
    if lang == 'en'
      self.content_en
    elsif lang == "ru"
      self.content_ru
    else
      self.content_ro
    end
  end
end
