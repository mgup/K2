require_relative 'seeds/direction_categories'
require_relative 'seeds/directions'

require_relative 'seeds/marital_statuses'
require_relative 'seeds/relationships'

require_relative 'seeds/employee_categories'
require_relative 'seeds/hr_qualifications'
require_relative 'seeds/departments'

Office::DocumentType.delete_all
[
  { prefix: '01-03',  name: 'Приказы проректоров по общим вопросам' },
  { prefix: '01-03р', name: 'Приказы Ректора по общим вопросам' },
  { prefix: '01-04',  name: 'Приказы по учебно-методической и воспитательной работе' },
  { prefix: '01-05',  name: 'Приказы по научно-исследовательским вопросам' },
  { prefix: '01-06',  name: 'Приказы по аспирантуре и докторантуре' },
  { prefix: '01-17',  name: 'Приказы довузовской и послевузовской подготовки' },
  { prefix: '01-26',  name: 'Распоряжения проректоров' },
  { prefix: '01-26р', name: 'Распоряжения Ректора' },
  { prefix: '01-36',  name: 'Приказы по вопросам дополнительного профессионального образования и довузовской '\
                            'подготовки' },
  { prefix: '01-37',  name: 'Приказы по стипендиям и выплатам' },
  { prefix: '01-38',  name: 'Приказы по котировкам и аукционам' }
].each { |document_type_data| Office::DocumentType.create(document_type_data) }

[
  {
    document_type_id: Office::DocumentType.find_by_prefix('01-03р').id,
    number: 80,
    date: Date.new(2015, 9, 17),
    title: 'О возложении обязанностей',
    document: File.new(Rails.root.join('db', 'seeds', '01-03p_80_17.09.15.pdf'))
  },
  {
    document_type_id: Office::DocumentType.find_by_prefix('01-03р').id,
    number: 81,
    date: Date.new(2015, 9, 30),
    title: 'Об учете бланков строгой отчетности',
    document: File.new(Rails.root.join('db', 'seeds', '01-03p_81_30.09.15.pdf'))
  }
].each do |order_data|
  Office::Order.create(order_data)
end

AcademicDegree.delete_all
AcademicDegree.create(name: 'Доктор наук')
AcademicDegree.create(name: 'Кандидат наук')

AcademicTitle.delete_all
AcademicTitle.create(name: 'Профессор')
AcademicTitle.create(name: 'Доцент')

Citizenship.delete_all
Citizenship.create(id: 1, name: 'Гражданин Российской Федерации')
Citizenship.create(id: 2, name: 'Гражданин Российской Федерации и иностранного государства (двойное гражданство)')
Citizenship.create(id: 3, name: 'Иностранный гражданин')
Citizenship.create(id: 4, name: 'Лицо без гражданства')

Language.delete_all
Language.create(id: 14, name: 'Английский')
Language.create(id: 69, name: 'Испанский')
Language.create(id: 135, name: 'Немецкий')
Language.create(id: 213, name: 'Французский')

LanguageProficiency.delete_all
LanguageProficiency.create(id: 1, name: 'Читает и переводит со словарём')
LanguageProficiency.create(id: 2, name: 'Читает и может объясняться')
LanguageProficiency.create(id: 3, name: 'Владеет свободно')

EducationLevel.delete_all
EducationLevel.create(id: 1, name: 'Дошкольное образование')
EducationLevel.create(id: 2, name: 'Начальное образование')
EducationLevel.create(id: 3, name: 'Основное общее образование')
EducationLevel.create(id: 7, name: 'Среднее (полное) общее образование')
EducationLevel.create(id: 10, name: 'Начальное профессиональное образование')
EducationLevel.create(id: 11, name: 'Среднее профессиональное образование')
EducationLevel.create(id: 15, name: 'Неполное высшее образование')
EducationLevel.create(id: 18, name: 'Высшее образование')
EducationLevel.create(id: 19, name: 'Послевузовское образование')

User.delete_all
User.create!(
  id: 1,
  email: 'vshlyaga@acm.org',
  password: '12345678',
  password_confirmation: '12345678',

  person_attributes: {
    last_name: 'Шляга',
    first_name: 'Виталий',
    patronymic: 'Сергеевич',

    birthdate: Date.new(1986, 10, 27),
    birthplace: 'гор. Челябинск',
    sex: :male,
    citizenship_id: 1,
    education_level_id: 18,
    marital_status_id: 2,

    foreign_languages_attributes: [
      {
        person_id: 1,
        language_id: 14,
        language_proficiency_id: 3
      },
      {
        person_id: 1,
        language_id: 135,
        language_proficiency_id: 1
      }
    ]
  }
)

# vshlyaga.education_documents.create!(
#   {
#     institution: 'Московский государственный университет печати',
#     name: 'диплом с отличием',
#     series: 'АБ',
#     number: '107705 0406573',
#     year_of_ending: 2011,
#     qualification: 'Инженер',
#     direction_id: Direction.unscoped.find_by_old_code('230204').id
#   }
# )
#
# vshlyaga.relatives.create!(
#   {
#    name: 'Шляга Вероника Владиславовна',
#    year_of_birth: 1966,
#    relationship_id: 4
#   }
# )
# vshlyaga.relatives.create!(
#   {
#    name: 'Шляга Дарья Сергеевна',
#    year_of_birth: 1989,
#    relationship_id: 21
#   }
# )

require_relative 'seeds/hr_positions'
