# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Goal.create(name: 'Get fit', description: 'Exercise at least 30 minutes a day!')
# goal_id: 1
Goal.create(name: "Clean", description: "Mop the floors. Vacuum the carpet. Windex the windows. Do laundry.")
# goal_id: 2

User.create(name: 'Clara', email: 'Clara@email.com', password: 'pw')
# user_id: 1
Entry.create(title: 'Running is hard', content: 'Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! ', user_id: 1, goal_id: 1)
Entry.create(title: 'House is So Messy!', content: "Wow, I haven't cleaned in weeks. I should probably do that! Wow, I haven't cleaned in weeks. I should probably do that! Wow, I haven't cleaned in weeks. I should probably do that! Wow, I haven't cleaned in weeks. I should probably do that! ", user_id: 1, goal_id: 2)

User.create(name: 'Morticia', email: 'Morticia@email.com', password:'pw')
# user_id: 2
Entry.create(title: "New Year's Resolution!", content: "New year, new me! Let's get that bikini body! New year, new me! Let's get that bikini body! New year, new me! Let's get that bikini body! New year, new me! Let's get that bikini body! New year, new me! Let's get that bikini body!", user_id: 2, goal_id: 1)
Entry.create(title: "Broke My New Year's Resolution", content: "Last night was a rager. Went ham on those canapés. Gotta clean the house now... Last night was a rager. Went ham on those canapés. Gotta clean the house now... Last night was a rager. Went ham on those canapés. Gotta clean the house now...", user_id: 2, goal_id: 2)
