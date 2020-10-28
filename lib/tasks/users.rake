namespace :users do
    desc "Generate users for seed database"
    task create_initials: :environment do
      # Users
      user_count = 0
      user_created = 0
      puts "----------------------------------------"
      puts "CREATE USERS"
      puts "----------------------------------------\n"
      [
        {
            email: "first@test.com",
            password: "password",
            name: "First",
            surname: "Test"
        },
        {
            email: "second@test.com",
            password: "password",
            name: "Second",
            surname: "Test"
        }

    ].each do |getter_user|
        user_count+=1
        puts "----------------------------------------"
        puts "User: #{getter_user[:name]}, started..."
        user = User.find_by_email(getter_user[:email])
        if !user.present?
            puts "Create new user!"
            user = User.create(getter_user)
            user.roles << Role.find(user_created+1) if Role.find_by(id: user_created+1).present?
            user_created+=1
        end
    end
    puts "----------------------------------------\n"
    puts "----------------------------------------"
    puts "Total: #{user_count}, Creados: #{user_created}"
    puts "----------------------------------------\n\n"
  end

end
