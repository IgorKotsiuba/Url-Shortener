class Link < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :original

  after_create :generate_slug

  def generate_slug
    self.short = self.id.to_s(36)
    self.save
  end

  def display_slug
    'http://localhost:3000/' + self.short
  end
end
