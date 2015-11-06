class Link < ActiveRecord::Base
  REGEX = '^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}'

  belongs_to :user
  validates_presence_of :original
  validates_format_of :original, with: /REGEX/, message: "URL should have valid format"

  after_create :generate_slug

  def generate_slug
    self.short = self.id.to_s(36)
    self.save
  end

  def display_slug
    'http://localhost:3000/' + self.short
  end
end
