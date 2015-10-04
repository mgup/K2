# Модель Пользователь.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_authorization_subject
  acts_as_paranoid

  belongs_to :citizenship
  has_many :foreign_languages, class_name: 'Hr::ForeignLanguage'
  has_many :languages, through: :foreign_languages

  belongs_to :academic_degree
  belongs_to :academic_title

  def to_s
    full_name
  end

  def full_name
    "#{last_name} #{first_name} #{patronymic}"
  end
end
