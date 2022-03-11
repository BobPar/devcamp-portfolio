module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :current_user
  end

  def current_user
    super || guest_user
  end

  def guest_user
    # OpenStruct.new(name: "Katsuhiro Sugada", 
    #                first_name: "Guest", 
    #                last_name: "User", 
    #                email: "guest@exmple.com"
    #               )
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@exmple.com"
    guest
  end
end
