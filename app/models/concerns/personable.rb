# Функционал, добавляющий к модели возможность вести себя как «человек»:
# обладать фамилией, именем, отчеством, датой рождения, документами об
# образовании и так далее.
module Personable
  extend ActiveSupport::Concern

  included do
    has_one :person, as: :personable, dependent: :destroy
    accepts_nested_attributes_for :person

    delegate :full_name, to: :person
    delegate :short_name, to: :person
    delegate :last_name, to: :person
    delegate :first_name, to: :person
    delegate :patronymic, to: :person
    delegate :male?, to: :person
    delegate :birthdate, to: :person
    delegate :birthplace, to: :person
    delegate :citizenship, to: :person
    delegate :education_level, to: :person
    delegate :education_documents, to: :person
    delegate :foreign_languages, to: :person
  end
end
