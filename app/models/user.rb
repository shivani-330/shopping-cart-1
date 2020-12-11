class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable
  has_one_attached :image
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:seller) if self.roles.blank?
  end
end
