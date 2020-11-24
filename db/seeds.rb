# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create(title: '世界のミステリー', order_number: 1, text: '世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、')
Genre.create(title: '日本のミステリー', order_number: 2)
Genre.create(title: '神話', order_number: 3)
Genre.create(title: '化学', order_number: 4)
Genre.create(title: '人物', order_number: 5)
Genre.create(title: '組織', order_number: 6)
Genre.create(title: '未解決事件', order_number: 7)
Genre.create(title: '雑学', order_number: 8)
if Rails.env == "development"
  1000.times {
    genre_id = rand(1..9)
    article = Article.create(title: 'タイトルテキスト、タイトルテキスト、タイトルテキスト、タイトルテキスト、タイトルテキスト、',
                            eyecatch: 'アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、',
                            genre_id: genre_id,
                            release: true,
                            pv_count: rand(10..10000))
    Tag.create(title: 'タグ', article_id: article.id)
  }
end