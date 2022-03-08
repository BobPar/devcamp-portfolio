module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Devcamp | XXX"
    @seo_keywords = "Katsuhiro Sugada Portfolio"
  end
end




