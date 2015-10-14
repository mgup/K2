Hr::Qualification.delete_all
[
  { id: 1, name: 'Ректор', employee_category_id: 1 },
  { id: 2, name: 'Проректор', employee_category_id: 1 },
  { id: 3, name: 'Начальник', employee_category_id: 1 },
  { id: 4, name: 'Директор института', employee_category_id: 2 },
  { id: 5, name: 'Заведующий кафедрой', employee_category_id: 2 },
  { id: 6, name: 'Профессор', employee_category_id: 2 },
  { id: 7, name: 'Доцент', employee_category_id: 2 },
  { id: 8, name: 'Старший преподаватель', employee_category_id: 2 },
  { id: 9, name: 'Ассистент', employee_category_id: 2 }
].each do |qualification|
  Hr::Qualification.create(qualification)
end
