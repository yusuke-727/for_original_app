user = User.create!(
  name: '鈴木',
  email: 'suzuki@email.com',
  password: 'password1',
  password_confirmation: 'password1',
  is_admin: false
)

user = User.create!(
  name: '佐藤',
  email: 'sato@email.com',
  password: 'password2',
  password_confirmation: 'password2',
  is_admin: false
)

user = User.create!(
  name: '伊藤',
  email: 'ito@email.com',
  password: 'password3',
  password_confirmation: 'password3',
  is_admin: false
)

user = User.create!(
  name: '田中',
  email: 'tanaka@email.com',
  password: 'password5',
  password_confirmation: 'password5',
  is_admin: false
)

admin_user = User.create!(
  name: 'admin_name',
  email: 'admin@email.com',
  password: 'password4',
  password_confirmation: 'password4',
  is_admin: true
)

20.times do |i|
  event = Event.create!(
    title: "会議#{i + 1}",         
    content: "会議#{i + 1}の内容",  
    scheduled_date: Time.now + i.days,  
    )
end