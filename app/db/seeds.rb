# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Vtuber.first_or_create([
    {name: '桐生ココ', subscribers: 94.4, superchats: 161650781},
    {name: '潤羽るしあ', subscribers: 87.9, superchats: 156590880, youtube_views: 47624577, company: "ホロライブ", registered_day: "2019-07-03", link_to_channel: "https://www.youtube.com/channel/UCl_gCybOJRIgOXw6Qb4qJzQ"}
])

Video.first_or_create([
    {vtuber_id: 2, title: "10分でわかる潤羽るしあ台パン集【ホロライブ／切り抜き】", url: "https://www.youtube.com/watch?v=vch1kylo8qQ"},
    {vtuber_id: 2, title: "【歌ってみた】花に亡霊 / ヨルシカ【潤羽るしあcover】", url: "https://www.youtube.com/watch?v=UBSx4qqeikY"},
])