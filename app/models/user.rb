class User < ActiveRecord::Base

  has_secure_password

  has_many  :tasks

  validates_presence_of   :login
  validates_uniqueness_of :login

  before_save :generate_api_key

  private

  def generate_api_key
    self.api_key = SecureRandom.urlsafe_base64(15)
    if User.where(api_key: self.api_key).present?
      generate_api_key
    end
  end

end
