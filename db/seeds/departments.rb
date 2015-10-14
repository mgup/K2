Department.delete_all
Department.create!(
  id: 2,
  name: 'Департамент информационных технологий',
  abbreviation: 'ДИТ'
)
Department.create!(
  id: 1,
  main_department_id: 2,
  name: 'Отдел информационных систем',
  abbreviation: 'ОИС'
)
