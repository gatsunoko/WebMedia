# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create(title: '世界のミステリー', text: '世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、世界のミステリーあれやこれやのジャンル、')
Genre.create(title: '日本のミステリー')
Genre.create(title: '都市伝説')
Genre.create(title: '神話')
Genre.create(title: '化学')
Genre.create(title: '人物')
Genre.create(title: '組織')
1000.times {
  genre_id = rand(1..7)
  article = Article.create(title: 'タイトルテキスト、タイトルテキスト、タイトルテキスト、タイトルテキスト、タイトルテキスト、',
                           eyecatch: 'アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、アイキャッチテキスト、',
                           genre_id: genre_id,
                           release: true,
                           pv_count: rand(10..10000))
  Tag.create(title: 'タグ', article_id: article.id)
}