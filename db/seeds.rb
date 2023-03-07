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




puts "Done seeding!"