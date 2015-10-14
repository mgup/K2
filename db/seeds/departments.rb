Department.delete_all
Department.create!(
  id: 3,
  name: 'Ректорат',
  abbreviation: 'Ректорат'
)
Department.create!(
  id: 4,
  main_department_id: 3,
  name: 'Проректор по административно-хозяйственной работе',
  abbreviation: 'Проректор по АХР'
)
Department.create!(
  id: 2,
  main_department_id: 4,
  name: 'Департамент информационных технологий',
  abbreviation: 'ДИТ'
)
Department.create!(
  id: 1,
  main_department_id: 2,
  name: 'Отдел информационных систем',
  abbreviation: 'ОИС'
)
