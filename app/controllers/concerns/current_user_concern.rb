module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :current_user
  end

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Katsuhiro Sugada", 
                   first_name: "Guest", 
                   last_name: "User", 
                   email: "sguada@gmail.com"
                  )
  end
end




