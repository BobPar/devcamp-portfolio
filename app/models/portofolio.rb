class Portofolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    self.where(subtitle: "Angular")
  end
  scope :ruby_on_rails_portofolio_items, -> { where(subtitle: "Ruby on Rails") }
end
