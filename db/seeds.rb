# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Clara', email: 'Clara@email.com', password: 'pw')
Entry.create(title: 'Running is hard', content: 'Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! Today I ran 10 miles. Hooray! ', user_id: 1, goal_id: 1)
Goal.create(name: 'Get fit', description: 'Exercise at least 30 minutes a day!')

Entry.create(title: 'House is So Messy!' content: "Wow, I haven't cleaned in weeks. I should probably do that! Wow, I haven't cleaned in weeks. I should probably do that! Wow, I haven't cleaned in weeks. I should probably do that! Wow, I haven't cleaned in weeks. I should probably do that! ", user_id: 1, goal_id: 1)