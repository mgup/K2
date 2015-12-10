# Модель Пользователь.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  has_paper_trail

  belongs_to :userable, polymorphic: true

  delegate :full_name, to: :userable

  def to_param
    "#{id} #{full_name}".parameterize
  end

  def to_s
    full_name
  end

  def employee?
    userable.instance_of?(Employee)
  end
end
