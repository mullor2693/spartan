require 'faker'

namespace :users do
    desc "Generate users for seed database"
    task create_initials: :environment do
        # Users
        user_count = 0
        user_created = 0
        getter_user = { email: Faker::Internet.email(domain: 'spartan.admin'), password: "password", name: Faker::Name.first_name, surname: Faker::Name.last_name }
        puts "----------------------------------------"
        puts "CREATE USERS"
        puts "----------------------------------------\n"
        (1...5).each do 
            user_count+=1
            puts "----------------------------------------"
            puts "User: #{getter_user[:name]}, started..."
            user = User.find_by_email(getter_user[:email])
            if !user.present?
                puts "Create new user!"
                user = User.create(getter_user)
                user.roles << Role.find(1) if Role.find_by(id: 1).present?
                user_created+=1
            end
        end
        puts "----------------------------------------\n"
        puts "----------------------------------------"
        puts "Total: #{user_count}, Creados: #{user_created}"
        puts "----------------------------------------\n\n"
    end

    desc "Generate users for populate"
    task populate: :environment do
        # Users
        user_count = 0
        user_created = 0
        puts "----------------------------------------"
        puts "CREATE USERS"
        puts "----------------------------------------\n"
        (1..30).each do |getter_user|
            user_count+=1
            
            random_name = ('a'..'z').to_a.shuffle[0,8].join
            getter_user = {}
            getter_user[:name] = Faker::Name.first_name
            getter_user[:surname] = Faker::Name.last_name
            getter_user[:email] = Faker::Internet.email(domain: 'spartan.test')
            getter_user[:password] = "password"
            getter_user[:birth_date] = Date.today - rand(18...60).years - rand(0...12).months - rand(0...30).days
            getter_user[:dni] = rand(10000000...99999999).to_s + ('A'...'Z').to_a.shuffle[0,1].join
            getter_user[:address] = ('a'..'z').to_a.shuffle[0,3].join.capitalize + " " + ('a'..'z').to_a.shuffle[0,8].join.capitalize + " " + ('a'..'z').to_a.shuffle[0,5].join.capitalize
            getter_user[:phone] = rand(600000000...800000000)
            getter_user[:desired_weight] = rand(70...80)
            getter_user[:height] = rand(130...200)
            getter_user[:weight] = rand(50...120)
            getter_user[:sex] = rand(0..1)

            puts "----------------------------------------"
            puts "User: #{getter_user[:name]}, started..."
            user = User.find_by_email(getter_user[:email])
            if !user.present?
                puts "Create new user!"
                user = User.create(getter_user)
                user_created+=1
            end
        end
        puts "----------------------------------------\n"
        puts "----------------------------------------"
        puts "Total: #{user_count}, Creados: #{user_created}"
        puts "----------------------------------------\n\n"
    end

end
