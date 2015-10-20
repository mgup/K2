Department.delete_all
Department.create!(
  id: 3,
  name: 'Ректорат',
  abbreviation: 'Ректорат'
)
Department.create!(
  id: 4,
  name: 'Проректор по административно-хозяйственной работе',
  abbreviation: 'Проректор по АХР'
)
Department.create!(
  id: 2,
  parent_id: 4,
  name: 'Департамент информационных технологий',
  abbreviation: 'ДИТ'
)
Department.create!(
  id: 1,
  parent_id: 2,
  name: 'Отдел информационных систем',
  abbreviation: 'ОИС'
)
Department.create!(
  id: 5,
  parent_id: 2,
  name: 'Отдел администрирования компьютерных сетей',
  abbreviation: 'ОАКС'
)
Department.create!(
  id: 6,
  parent_id: 2,
  name: 'Отдел технической поддержки',
  abbreviation: 'Техподдержка'
)
Department.create!(
  id: 7,
  parent_id: 6,
  name: 'Сектор № 1',
  abbreviation: 'Сектор № 1'
)
Department.create!(
  id: 8,
  parent_id: 6,
  name: 'Сектор № 2',
  abbreviation: 'Сектор № 2'
)
Department.create!(
  id: 9,
  parent_id: 2,
  name: 'Отдел обеспечения учебного процесса',
  abbreviation: 'ОБУП'
)
Department.create!(
  id: 10,
  parent_id: 2,
  name: 'Копировально-множительный отдел',
  abbreviation: 'КМО'
)
Department.create!(
  id: 12,
  parent_id: 3,
  name: 'Департамент финансовой политики',
  abbreviation: 'ДФП'
)
Department.create!(
  id: 13,
  parent_id: 12,
  name: 'Планово-экономический отдел',
  abbreviation: 'ПЭО'
)
Department.create!(
  id: 14,
  parent_id: 3,
  name: 'Бухгалтерия',
  abbreviation: 'Бухгалтерия'
)
Department.create!(
  id: 15,
  parent_id: 3,
  name: 'Научно-учебная лаборатория «Проблемы цифрового наследия»',
  abbreviation: 'НУЛ «ПЦН»'
)
Department.create!(
  id: 16,
  parent_id: 3,
  name: 'Департамент развития, общественных связей и организации приема',
  abbreviation: 'ДРОСиОП'
)
Department.create!(
  id: 17,
  parent_id: 16,
  name: 'Музей истории',
  abbreviation: 'Музей'
)
Department.create!(
  id: 18,
  parent_id: 16,
  name: 'Редакция официального сайта и корпоративных медиа',
  abbreviation: 'РОСиКМ'
)
Department.create!(
  id: 19,
  parent_id: 16,
  name: 'Отдел рекламы и социальных медиа',
  abbreviation: 'ОРиСМ'
)
Department.create!(
  id: 20,
  parent_id: 16,
  name: 'Центр организации и приема',
  abbreviation: 'ЦОиП'
)
Department.create!(
  id: 21,
  parent_id: 16,
  name: 'Дирекция выставок',
  abbreviation: 'ДВ'
)
Department.create!(
  id: 22,
  parent_id: 16,
  name: 'Центр дополнительного образования в области медиаиндустрии',
  abbreviation: 'ЦДОвОМ'
)
Department.create!(
  id: 23,
  parent_id: 22,
  name: 'Отдел повышения квалификации и дополнительного образования в отрасли',
  abbreviation: 'ОПКиДОвО'
)
Department.create!(
  id: 24,
  parent_id: 22,
  name: 'Отдел повышения квалификации и дополнительного образования в издательском деле',
  abbreviation: 'ОПКиДОвИД'
)
Department.create!(
  id: 25,
  parent_id: 22,
  name: 'Отдел дополнительного профессионального образования специалистов издательских подразделений вузов',
  abbreviation: 'ОДПОСИПВ'
)
Department.create!(
  id: 26,
  parent_id: 16,
  name: 'Центр профориентационной работы и довузовской подготовки',
  abbreviation: 'ЦПРиДВ'
)
Department.create!(
  id: 27,
  parent_id: 3,
  name: 'Департамент по внеучебной работе и молодежной политике',
  abbreviation: 'ДВРиМП'
)
Department.create!(
  id: 28,
  parent_id: 27,
  name: 'Центр социальной поддержки и воспитательной работы',
  abbreviation: 'ЦСПиВР'
)
Department.create!(
  id: 29,
  parent_id: 27,
  name: 'Центр студенческих инициатив и культурно-массовой работы',
  abbreviation: 'ЦСИиКМР'
)
Department.create!(
  id: 30,
  parent_id: 27,
  name: 'Студенческий спортивный клуб',
  abbreviation: 'ССК'
)
