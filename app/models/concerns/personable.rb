# Функционал, добавляющий к модели возможность вести себя как «человек»:
# обладать фамилией, именем, отчеством, датой рождения, документами об
# образовании и так далее.
module Personable
  extend ActiveSupport::Concern

  included do
    has_one :person, as: :personable, dependent: :destroy
    accepts_nested_attributes_for :person

    delegate :full_name, :short_name, :last_name, :first_name, :patronymic,
             :male?, :birthdate, :birthplace, :citizenship, :education_level,
             :education_documents, :foreign_languages, to: :person
  end
end
