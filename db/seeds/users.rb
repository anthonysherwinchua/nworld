User.create!([
               { email: 'admin@nworld.com', password: 'password123' }
             ])

User.first.add_role :admin
