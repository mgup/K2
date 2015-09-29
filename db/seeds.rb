Role.delete_all
Role.create(name: 'developer')

User.delete_all
vshlyaga = User.create(
  email: 'vshlyaga@acm.org',
  password: '12345678',
  password_confirmation: '12345678'
)
vshlyaga.has_role!(:developer)

Office::DocumentType.delete_all
[
  { prefix: '01-03',  name: 'Приказы проректоров по общим вопросам' },
  { prefix: '01-03р', name: 'Приказы Ректора по общим вопросам' },
  { prefix: '01-04',  name: 'Приказы по учебно-методической и воспитательной \
                             работе' },
  { prefix: '01-05',  name: 'Приказы по научно-исследовательским вопросам' },
  { prefix: '01-06',  name: 'Приказы по аспирантуре и докторантуре' },
  { prefix: '01-17',  name: 'Приказы довузовской и послевузовской подготовки' },
  { prefix: '01-26',  name: 'Распоряжения проректоров' },
  { prefix: '01-26р', name: 'Распоряжения Ректора' },
  { prefix: '01-36',  name: 'Приказы по вопросам дополнительного \
                             профессионального образования и довузовской \
                             подготовки' },
  { prefix: '01-37',  name: 'Приказы по стипендиям и выплатам' },
  { prefix: '01-38',  name: 'Приказы по котировкам и аукционам' }
].each { |document_type| Office::DocumentType.create(document_type) }
