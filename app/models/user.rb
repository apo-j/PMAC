class User < ActiveRecord::Base
  has_many :addresses
  has_one :person
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :login, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  before_save {self.login = self.login.downcase}

  scope :all_info, ->(id){includes([:addresses, :person]).find(id)}

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
