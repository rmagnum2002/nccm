module ApplicationHelper
  def lang_links
    LOCALES.keys.sort.map { |k| link_to_if(@locale != k, k, set_locale_path(:lang => k, 
          :back => request.fullpath))}.join " | "
  end
end
