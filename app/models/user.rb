class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable, :omniauthable

  before_create :generate_authentication_token
  validates :role, presence: true
  before_create :set_default_role

  enum :role, { admin: 0, normal_user: 1, user: 2 }

  # Métodos para facilitar a verificação de funções específicas
  def admin?
    role == "admin"
  end

  def normal_user?
    role == "normal_user"
  end

  def user?
    role == "user"
  end  

  private

  def generate_authentication_token
    loop do
      self.authentication_token = Devise.friendly_token
      break unless User.exists?(authentication_token: authentication_token)
    end
  end    

  def set_default_role
    self.role ||= :user
  end
end
