class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = KatsuDevcampViewTool::Renderer.copyright("Katsuhiro", "All rihgts reserved")
  end
end

module KatsuDevcampViewTool
  class Renderer
    def self.copyright(name, msg)
      "&copy; #{Time.current.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
