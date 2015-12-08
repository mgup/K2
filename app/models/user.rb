# Модель Пользователь.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_paper_trail

  has_one :employee

  def to_param
    "#{id} #{full_name}".parameterize
  end

  def to_s
    full_name
  end

  def full_name
    return employee.person.full_name if employee.present?
  end
end
