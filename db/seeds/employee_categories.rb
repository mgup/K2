EmployeeCategory.delete_all
[
  { id: 1, name: 'Руководящий персонал' },
  { id: 2, name: 'Профессорско-преподавательский состав' },
  { id: 3, name: 'Научные работники' },
  { id: 4, name: 'Инженерно-технический персонал' },
  { id: 5, name: 'Административно-хозяйственный персонал' },
  { id: 6, name: 'Производственный персонал' },
  { id: 7, name: 'Учебно-вспомогательный персонал' },
  { id: 8, name: 'Обслуживающий персонал' }
].each do |employee_category|
  EmployeeCategory.create(employee_category)
end
