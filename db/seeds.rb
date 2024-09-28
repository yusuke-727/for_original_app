# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |i|
    Event.create!(
      title: "会議#{i + 1}",          # タイトル
      content: "会議#{i + 1}の内容",  # 内容
      scheduled_date: Time.now + i.days,  # 予定日時（現在時刻からi日後）
      created_at: Time.now,              # 作成日時
      updated_at: Time.now               # 更新日時
    )
  end
  
