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
Department.create!(
  id: 31,
  name: 'Проректор по административно-правовым вопросам',
  abbreviation: 'Проректор по АПВ'
)
Department.create!(
  id: 32,
  parent_id: 31,
  name: 'Секретариат',
  abbreviation: 'Секретариат'
)
Department.create!(
  id: 33,
  parent_id: 31,
  name: 'Управление по безопасности и мобподготовке',
  abbreviation: 'УБМ'
)
Department.create!(
  id: 34,
  parent_id: 33,
  name: 'Специальный отдел',
  abbreviation: 'Специальный отдел'
)
Department.create!(
  id: 35,
  parent_id: 33,
  name: 'Моботдел',
  abbreviation: 'Моботдел'
)
Department.create!(
  id: 36,
  parent_id: 33,
  name: 'Штаб по делам гражданской обороны и чрезвычайным ситуациям',
  abbreviation: 'Штаб по делам ГОиЧС'
)
Department.create!(
  id: 37,
  parent_id: 31,
  name: 'Управление делами',
  abbreviation: 'Управление делами'
)
Department.create!(
  id: 38,
  parent_id: 37,
  name: 'Отдел кадров',
  abbreviation: 'Отдел кадров'
)
Department.create!(
  id: 39,
  parent_id: 37,
  name: 'Студенческий отдел кадров',
  abbreviation: 'Студенческий отдел кадров'
)
Department.create!(
  id: 40,
  parent_id: 37,
  name: 'Общий отдел',
  abbreviation: 'Общий отдел'
)
Department.create!(
  id: 41,
  parent_id: 31,
  name: 'Правовой отдел',
  abbreviation: 'Правовой отдел'
)
Department.create!(
  id: 42,
  parent_id: 41,
  name: 'Отдел по управлению имущественным комплексом',
  abbreviation: 'ОУИК'
)
Department.create!(
  id: 43,
  parent_id: 41,
  name: 'Отдел юридического обеспечения и государственных закупок',
  abbreviation: 'ОЮОиГЗ'
)
Department.create!(
  id: 44,
  parent_id: 31,
  name: 'Центр полиграфического искусства «Печатный двор Ивана Федорова»',
  abbreviation: 'ЦПИ «Печатный двор Ивана Федорова»'
)
Department.create!(
  id: 45,
  parent_id: 31,
  name: 'Редакция журнала «Высшее образование в России»',
  abbreviation: 'Редакция журнала «Высшее образование в России»'
)
Department.create!(
  id: 46,
  parent_id: 3,
  name: 'Первый проректор по учебной работе',
  abbreviation: 'Первый проректор по учебной работе'
)
Department.create!(
  id: 47,
  parent_id: 46,
  name: 'Институт принтмедиа и информационных технологий',
  abbreviation: 'ИПИТ'
)
Department.create!(
  id: 48,
  parent_id: 46,
  name: 'Институт коммуникаций и медиабизнеса',
  abbreviation: 'ИКИМ'
)
Department.create!(
  id: 49,
  parent_id: 48,
  name: 'Кафедра "Реклама и связи с общественностью в медиаиндустрии"',
  abbreviation: 'РиСО'
)
Department.create!(
  id: 50,
  parent_id: 47,
  name: 'Кафедра "Информатика и информационные технологии"',
  abbreviation: 'ИиИТ'
)

