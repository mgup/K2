Hr::Position.delete_all

vshlyaga_position = Hr::Position.create!(
  id: 1,
  department_id: 1,
  qualification_id: 3,
  user_id: 1
)
vshlyaga_position.add_role :developer

# Hr::Position.create!(
#   id: 2,
#   department_id: 2,
#   qualification_id: 10
# )
# Hr::Position.create!(
#   id: 3,
#   department_id: 4,
#   qualification_id: 2
# )
# Hr::Position.create!(
#   id: 4,
#   department_id: 3,
#   qualification_id: 1
# )
# Hr::Position.create!(
#   id: 5,
#   department_id: 1,
#   qualification_id: 11
# )
# Hr::Position.create!(
#   id: 6,
#   department_id: 1,
#   qualification_id: 12
# )
# Hr::Position.create!(
#   id: 7,
#   department_id: 1,
#   qualification_id: 12
# )
# Hr::Position.create!(
#   id: 8,
#   department_id: 2,
#   qualification_id: 13
# )
# Hr::Position.create!(
#   department_id: 5,
#   qualification_id: 3
# )
# Hr::Position.create!(
#   department_id: 5,
#   qualification_id: 14
# )
# Hr::Position.create!(
#   department_id: 5,
#   qualification_id: 15
# )
# Hr::Position.create!(
#   department_id: 5,
#   qualification_id: 15
# )
# Hr::Position.create!(
#   department_id: 5,
#   qualification_id: 15
# )
