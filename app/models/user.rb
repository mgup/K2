# Модель Пользователь.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_authorization_subject
  acts_as_paranoid

  enum sex: { male: 1, female: 2 }

  belongs_to :citizenship
  has_many :foreign_languages, class_name: 'Hr::ForeignLanguage',
                               dependent: :destroy
  has_many :languages, through: :foreign_languages

  belongs_to :academic_degree
  belongs_to :academic_title

  language_reject_condition = lambda do |fl|
    fl[:language_id].blank? || fl[:language_proficiency_id].blank?
  end
  accepts_nested_attributes_for :foreign_languages,
                                reject_if: language_reject_condition,
                                allow_destroy: true

  def to_s
    full_name
  end

  def full_name
    "#{last_name} #{first_name} #{patronymic}"
  end
end
