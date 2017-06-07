class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  has_many :reviews
  has_many :favorites
  has_many :fans, through: :favorites, source: :user
  before_validation :generate_friendly_id, :on => :create
  acts_as_list

  def to_param
    self.friendly_id
  end
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
  protected

  def generate_friendly_id
    self.friendly_id ||= SecureRandom.uuid
  end
  config.action_mailer.default_url_options = { host: "http://young-waters-36000.herokuapp.com" }

end
