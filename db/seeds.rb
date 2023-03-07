puts "Seeding tables..."

user1 = User.create(
    username: 'Vanessa',
    email: 'vanessa@mail.com',
    password: 'pass1',
)
user2 = User.create(
    username: 'Rukorio',
    email: 'rukorio@mail.com',
    password: 'pass2',
)
user3 = User.create(
    username: 'Kirangari',
    email: 'kirangari@mail.com',
    password: 'pass3',
)


rand(1..7).times do
    Project.create(
    "title": Faker::Marketing.buzzwords,
    "description": Faker::Lorem.sentence,
    "user_id": user.id,
    "createdAt": rand(3..4)
    )
end

rand(1..5).times do
    Skill.create(
    "name": Faker::Job.key_skill,
    "user_id": user.id,
    )
end
end

puts "Done seeding!"