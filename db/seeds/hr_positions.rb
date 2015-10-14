Hr::Position.delete_all
Hr::Position.create!(
  id: 1,
  department_id: 1,
  qualification_id: 3,
  user_id: 1
)
Hr::Position.create!(
  id: 2,
  department_id: 2,
  qualification_id: 10
)
Hr::Position.create!(
  id: 3,
  department_id: 4,
  qualification_id: 2
)
Hr::Position.create!(
  id: 4,
  department_id: 3,
  qualification_id: 1
)
