# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  '村人',
  'ビギナー',
  '駆け出し冒険者',
  '脳筋',
  'ザコ剣士',
  '3流プログラマー',
  'トレジャーハンター',
  'ギャンブラー',
  '侍(サムライ)',
  'ミニマリスト',
  '黒魔術師',
  '１流プログラマー',
  'アマゾネス',
  'アウストラロピテクス',
  'ドラゴンスレイヤー',
  '職業イケメン',
  '大天使ミカエル',
  '東大卒',
  '冥王神ハーデス',
  '天才プログラマー',
  '全てを超えし者',
  '内閣総理大臣',
].each do |degree_name|
  Degree.create!(
    { degree_name: degree_name }
  )
end
