Role.delete_all
Role.create(name: 'developer')

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

EmployeeCategory.delete_all
[
  { name: 'Руководящий персонал' },
  { name: 'Профессорско-преподавательский состав' },
  { name: 'Научные работники' },
  { name: 'Инженерно-технический персонал' },
  { name: 'Административно-хозяйственный персонал' },
  { name: 'Производственный персонал' },
  { name: 'Учебно-вспомогательный персонал' },
  { name: 'Обслуживающий персонал' }
].each { |employee_category| EmployeeCategory.create(employee_category) }

head_personnel = EmployeeCategory.find_by_name('Руководящий персонал')
pps_personnel =
  EmployeeCategory.find_by_name('Профессорско-преподавательский состав')
Hr::Position.delete_all
[
  { name: 'Ректор', employee_category_id: head_personnel.id },
  { name: 'Проректор', employee_category_id: head_personnel.id },
  { name: 'Директор института', employee_category_id: pps_personnel.id },
  { name: 'Заведующий кафедрой', employee_category_id: pps_personnel.id },
  { name: 'Профессор', employee_category_id: pps_personnel.id },
  { name: 'Доцент', employee_category_id: pps_personnel.id },
  { name: 'Старший преподаватель', employee_category_id: pps_personnel.id },
  { name: 'Ассистент', employee_category_id: pps_personnel.id }
].each { |position| Hr::Position.create(position) }

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

User.delete_all
vshlyaga = User.create(
  email: 'vshlyaga@acm.org',
  password: '12345678',
  password_confirmation: '12345678',

  last_name: 'Шляга',
  first_name: 'Виталий',
  patronymic: 'Сергеевич',

  birthdate: Date.new(1986, 10, 27),
  birthplace: 'гор. Челябинск',
  sex: 1,
  citizenship_id: 1,

  foreign_languages_attributes: [
    {
      language_id: 14,
      language_proficiency_id: 3
    },
    {
      language_id: 135,
      language_proficiency_id: 1
    }
  ]
)
vshlyaga.has_role!(:developer)
