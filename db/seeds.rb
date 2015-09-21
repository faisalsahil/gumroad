# ruby encoding: utf-8
# Plan.create(name: 'Free',allowedsubscriptions: 100)
# Plan.create(name: '$7',allowedsubscriptions: 500)
# Plan.create(name: '$17',allowedsubscriptions: 3000)
# Plan.create(name: '$47',allowedsubscriptions: 15000)
# Plan.create(name: '$97',allowedsubscriptions: 100000)
User.create!({
                 :user_name=>"admin",
                 :email=>"admin@example.com",
                 :password=>"admin123",
                 # :password_confirmation=>"admin123",
                 :user_type =>"admin"
             })