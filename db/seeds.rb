# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# CREATE USER
#
User.create(email: 'louisdebraine@gmail.com', name: 'Loode', password: 'testtest', password_confirmation: 'testtest')
User.create(email: 'maxime.lepaicheux@gmail.com', name: 'Yulo', password: 'motdepasse', password_confirmation: 'motdepasse')
#
# CREATE CATEGORIES
#

# First level
Category.create(name: 'Languages', description: 'Description', public: true, parent_id: nil)
Category.create(name: 'Frameworks', description: 'Description', public: true, parent_id: nil)
Category.create(name: 'Concepts', description: 'Description', public: true, parent_id: nil)
Category.create(name: 'Divers', description: 'Description', public: true, parent_id: nil)

# Second level
Category.create(name: 'Javascript', description: 'Description', public: true, parent_id: 1)
Category.create(name: 'Ruby', description: 'Description', public: true, parent_id: 1)
Category.create(name: 'Python', description: 'Description', public: true, parent_id: 1)
Category.create(name: 'Php', description: 'Description', public: true, parent_id: 1)
Category.create(name: 'NodeJS', description: 'Description', public: true, parent_id: 1)
Category.create(name: 'Html5/CSS3', description: 'Description', public: true, parent_id: 1)

Category.create(name: 'Symfony 3', description: 'Description', public: true, parent_id: 2)
Category.create(name: 'Laravel', description: 'Description', public: true, parent_id: 2)
Category.create(name: 'Ruby on Rails', description: 'Description', public: true, parent_id: 2)
Category.create(name: 'SailsJS', description: 'Description', public: true, parent_id: 2)
Category.create(name: 'KoaJS', description: 'Description', public: true, parent_id: 2)
Category.create(name: 'ExpressJS', description: 'Description', public: true, parent_id: 2)

Category.create(name: 'Docker', description: 'Description', public: true, parent_id: 3)
Category.create(name: 'Git', description: 'Description', public: true, parent_id: 3)
Category.create(name: 'Micro-Services', description: 'Description', public: true, parent_id: 3)
Category.create(name: 'AWS', description: 'Description', public: true, parent_id: 3)
Category.create(name: 'Travis', description: 'Description', public: true, parent_id: 3)
