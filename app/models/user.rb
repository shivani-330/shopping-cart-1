class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :timeout_in => 30.minutes
  has_one_attached :image
  after_create :assign_default_role
  has_one :address, :autosave => true, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true
  has_many :orders, dependent: :destroy

  def latest_order
    orders.where(status: 0).first || new_order
  end

  private

  def new_order
    orders.create(status: 0)
  end

    def assign_default_role
      self.add_role(:buyer) if self.roles.blank?
    end
end
