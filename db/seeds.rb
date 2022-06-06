admin = User.create(
  name: 'admin',
  email: 'admin@gmail.com',
  role: 'admin',
  password: 'password',
  password_confirmation: 'password'
)

user = User.create(
  name: 'bob',
  email: 'bob@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)

resort= Resort.create(
  name: 'Eiffel Tower',
  city: 'Paris',
  country: 'France',
  image: 'abd',
  description: 'beatiful site',
  cost: 1
)

reservation= Reservation.create(
  user_id: user.id,
  resort_id: resort.id,
  date_from: '2022-07-09',
  date_to: '2022-07-15'
)