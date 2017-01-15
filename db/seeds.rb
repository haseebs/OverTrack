# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create(email: 'test@test.com', battletag: 'test#123', password: 'test123', password_confirmation: 'test123')
Match.create(map: 1, rank: 2500, group_size: 2, user_id: 1, notes: 'Got trolled', video_link: 'www.youtube.com/v/sdfsfe3s')
Match.create(map: 1, rank: 2500, group_size: 2, user_id: 1, notes: 'Got trolled', video_link: 'www.youtube.com/v/sdfsfe3s')
Match.create(map: 1, rank: 2550, group_size: 1, user_id: 1, video_link: 'www.youtube.com/v/sdfsfe3s')
Match.create(map: 1, rank: 2560, group_size: 2, user_id: 1)
Match.create(map: 1, rank: 2540, group_size: 3, user_id: 1, notes: 'Got trolled', video_link: 'www.youtube.com/v/sdfsfe3s')
Match.create(map: 1, rank: 2570, group_size: 2, user_id: 1, notes: 'Got trolled')

Hero.create(match_id: 1, hero: 1)
Hero.create(match_id: 1, hero: 3)
Hero.create(match_id: 2, hero: 10)
Hero.create(match_id: 3, hero: 1)
Hero.create(match_id: 4, hero: 7)
Hero.create(match_id: 4, hero: 2)
Hero.create(match_id: 4, hero: 6)
Hero.create(match_id: 5, hero: 4)
Hero.create(match_id: 6, hero: 5)
