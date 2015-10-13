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
  belongs_to :education_level
  belongs_to :academic_degree
  belongs_to :academic_title
  belongs_to :marital_status

  has_many :foreign_languages, class_name: 'Hr::ForeignLanguage',
                               dependent: :destroy
  has_many :languages, through: :foreign_languages
  has_many :education_documents, as: :person
  has_many :relatives, as: :person

  language_reject_condition = lambda do |fl|
    fl[:language_id].blank? || fl[:language_proficiency_id].blank?
  end
  accepts_nested_attributes_for :foreign_languages,
                                reject_if: language_reject_condition,
                                allow_destroy: true

  education_document_reject_condition = lambda do |fl|
    fl[:institution].blank? || fl[:name].blank? ||
    fl[:number].blank? || fl[:year_of_ending].blank? ||
    fl[:direction_id].blank?
  end
  accepts_nested_attributes_for :education_documents,
                                reject_if: education_document_reject_condition,
                                allow_destroy: true

  relative_reject_condition = lambda do |fl|
    fl[:name].blank? || fl[:relationship_id].blank?
  end
  accepts_nested_attributes_for :relatives,
                                reject_if: relative_reject_condition,
                                allow_destroy: true

  # validates :citizenship, presence: true
  # validates :education_level, presence: true
  validates_associated :foreign_languages
  validates_associated :education_documents

  def to_param
    "#{id} #{short_name}".parameterize
  end

  def to_s
    full_name
  end

  def full_name
    "#{last_name} #{first_name} #{patronymic}"
  end

  def short_name
    "#{last_name} #{first_name.first}. #{patronymic.first}."
  end

  # Необходимо, чтобы сессия пользователя по-умолчанию запоминалась
  # для текущего компьютера.
  def remember_me
    true
  end
end
