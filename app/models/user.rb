# Модель Пользователь.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  has_paper_trail

  belongs_to :userable, polymorphic: true

  # validates_presence_of :password, on: :create
  # validates_presence_of :password, on: :update, allow_blank: true
  #
  # before_update :hash_password, if: :password_changed?
  #
  # def hash_password
  #   self.password = self.password_was if self.password.blank?
  # end

  def to_param
    "#{id} #{full_name}".parameterize
  end

  def to_s
    full_name
  end

  def full_name
    return userable.person.full_name
  end

  def employee?
    userable.instance_of?(Employee)
  end

  protected

  def password_required?
    !password.blank? && super
  end
end
