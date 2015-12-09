Study::PlanPart.delete_all
Study::PlanPart.create!(id: 1, name: 'Дисциплины (модули)', ind: 'Б1')
Study::PlanPart.create!(id: 2, name: 'Практики', ind: 'Б2')
Study::PlanPart.create!(id: 3, name: 'Государственная итоговая аттестация', ind: 'Б3')
Study::PlanPart.create!(id: 4, name: 'Факультативы', ind: 'ФТД')

Study::PlanPart.create!(id: 5, parent_id: 1, name: 'Базовая часть', ind: 'Б1.Б')
Study::PlanPart.create!(id: 6, parent_id: 1, name: 'Вариативная часть', ind: 'Б1.В')
Study::PlanPart.create!(id: 7, parent_id: 2, name: 'Базовая часть', ind: 'Б2.Б')
Study::PlanPart.create!(id: 8, parent_id: 2, name: 'Вариативная часть', ind: 'Б2.В')
Study::PlanPart.create!(id: 9, parent_id: 3, name: 'Базовая часть', ind: 'Б3.Б')
Study::PlanPart.create!(id: 10, parent_id: 3, name: 'Вариативная часть', ind: 'Б3.В')

Study::PlanPart.create!(id: 11, parent_id: 6, name: 'Обязательные дисциплины', ind: 'Б1.В.ОД')
Study::PlanPart.create!(id: 12, parent_id: 6, name: 'Дисциплины по выбору', ind: 'Б1.В.ДВ')