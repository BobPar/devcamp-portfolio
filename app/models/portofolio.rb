class Portofolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    self.where(subtitle: "Angular")
  end
  scope :ruby_on_rails_portofolio_items, -> { where(subtitle: "Ruby on Rails") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "https://via.placeholder.com/600x400"
    self.thumb_image ||= "https://via.placeholder.com/300x200"
  end
end
