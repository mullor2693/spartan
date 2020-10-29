# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['exercises:create_initials'].invoke
Rake::Task['foods:create_initials'].invoke
Rake::Task['roles:create_initials'].invoke
Rake::Task['users:create_initials'].invoke
