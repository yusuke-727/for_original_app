users = [
  { name: "管理者太郎", email: "admin@example.com", password: "password", is_admin: true },
  { name: "山田花子", email: "hanako@example.com", password: "password", is_admin: false },
  { name: "鈴木一郎", email: "ichiro@example.com", password: "password", is_admin: false },
  { name: "佐藤美咲", email: "misaki@example.com", password: "password", is_admin: false },
  { name: "田中健太", email: "kenta@example.com", password: "password", is_admin: false }
]

users.each do |user|
  User.create!(
    name: user[:name],
    email: user[:email],
    password: user[:password],
    password_confirmation: user[:password],
    is_admin: user[:is_admin],
    confirmed_at: Time.current
  )
end

events = [
  { title: "新年会", content: "2025年の新年会を開催します。", scheduled_date: "2025-01-10 18:00:00" },
  { title: "春の花見", content: "桜の季節に花見をしましょう。", scheduled_date: "2025-04-05 12:00:00" },
  { title: "夏祭り", content: "恒例の夏祭りを開催します。", scheduled_date: "2025-07-20 16:00:00" },
  { title: "秋の運動会", content: "社内運動会を開催します。", scheduled_date: "2025-10-15 09:00:00" },
  { title: "忘年会", content: "2025年の締めくくりです。", scheduled_date: "2025-12-20 19:00:00" }
]

events.each do |event|
  Event.create!(
    title: event[:title],
    content: event[:content],
    scheduled_date: event[:scheduled_date]
  )
end

event_users = [
  { event_id: 1, user_id: 2, answer: "参加" },
  { event_id: 2, user_id: 3, answer: "不参加" },
  { event_id: 3, user_id: 4, answer: "未定" },
  { event_id: 4, user_id: 5, answer: "参加" },
  { event_id: 5, user_id: 1, answer: "参加" }
]

event_users.each do |eu|
  EventUser.create!(
    event_id: eu[:event_id],
    user_id: eu[:user_id],
    answer: eu[:answer]
  )
end