# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'json'
require 'open-uri'

puts 'Cleaning DB...'

User.destroy_all

puts 'Done!'

puts 'Seeding...'

user1 = User.new(
  email: 'danilo@castro.com',
  password: '123456',
  username: 'danilogcastro',
  first_name: 'Danilo',
  last_name: 'Castro',
  address: 'Praça Radial Sul 90',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user1.save!

user2 = User.new(
  email: 'andre@menezes.com',
  password: '123456',
  username: 'dedemenezes',
  first_name: 'Andre',
  last_name: 'Menezes',
  address: 'Rua Bambina 105',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: 'Rock' },
    "1" => { name: 'Metal' }
    }
  )

user2.save!

user3 = User.new(
  email: 'carla@valdivia.com',
  password: '123456',
  username: 'carlavaldivia',
  first_name: 'Carla',
  last_name: 'Valdivia',
  address: 'Rua Barão de Lucena 67',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user3.save!

user4 = User.new(
  email: 'luca@severo.com',
  password: '123456',
  username: 'lucasevero',
  first_name: 'Luca',
  last_name: 'Severo',
  address: 'Rua Barata Ribeiro 194',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: 'Rock' }
    }
  )

user4.save!

url = "https://randomuser.me/api/?nat=br"
user_serialized = URI.open(url).read
random_user = JSON.parse(user_serialized)
profile_pic = URI.open(random_user['results'][0]['picture']['medium'])

user5 = User.new(
  email: Faker::Internet.email ,
  password: '123456',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name ,
  last_name: Faker::Name.last_name,
  address: 'Avenida Nossa Senhora de Copacabana 435',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user5.photo.attach(io: profile_pic, filename: "#{user5.username}.png", content_type: 'image/png')
user5.save!

url = "https://randomuser.me/api/?nat=br"
user_serialized = URI.open(url).read
random_user = JSON.parse(user_serialized)
profile_pic = URI.open(random_user['results'][0]['picture']['medium'])

user6 = User.new(
  email: Faker::Internet.email ,
  password: '123456',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: 'Avenida Visconde de Pirajá 321',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user6.photo.attach(io: profile_pic, filename: "#{user6.username}.png", content_type: 'image/png')
user6.save!

url = "https://randomuser.me/api/?nat=br"
user_serialized = URI.open(url).read
random_user = JSON.parse(user_serialized)
profile_pic = URI.open(random_user['results'][0]['picture']['medium'])


user7 = User.new(
  email: Faker::Internet.email ,
  password: '123456',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name ,
  last_name: Faker::Name.last_name,
  address: 'Rua das Laranjeiras 336',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user7.photo.attach(io: profile_pic, filename: "#{user7.username}.png", content_type: 'image/png')
user7.save!

url = "https://randomuser.me/api/?nat=br"
user_serialized = URI.open(url).read
random_user = JSON.parse(user_serialized)
profile_pic = URI.open(random_user['results'][0]['picture']['medium'])


user8 = User.new(
  email: Faker::Internet.email ,
  password: '123456',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: 'Rua Barata Ribeiro 370',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user8.photo.attach(io: profile_pic, filename: "#{user8.username}.png", content_type: 'image/png')
user8.save!

url = "https://randomuser.me/api/?nat=br"
user_serialized = URI.open(url).read
random_user = JSON.parse(user_serialized)
profile_pic = URI.open(random_user['results'][0]['picture']['medium'])


user9 = User.new(
  email: Faker::Internet.email ,
  password: '123456',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: 'Rua Vinicius de Morais 49',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user9.photo.attach(io: profile_pic, filename: "#{user9.username}.png", content_type: 'image/png')
user9.save!

url = "https://randomuser.me/api/?nat=br"
user_serialized = URI.open(url).read
random_user = JSON.parse(user_serialized)
profile_pic = URI.open(random_user['results'][0]['picture']['medium'])

user10 = User.new(
  email: Faker::Internet.email ,
  password: '123456',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: 'Rua Dona Mariana 182',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user10.photo.attach(io: profile_pic, filename: "#{user10.username}.png", content_type: 'image/png')
user10.save!

url = "https://randomuser.me/api/?nat=br"
user_serialized = URI.open(url).read
random_user = JSON.parse(user_serialized)
profile_pic = URI.open(random_user['results'][0]['picture']['medium'])

user11 = User.new(
  email: Faker::Internet.email ,
  password: '123456',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: 'Rua Riachuelo 119',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user11.photo.attach(io: profile_pic, filename: "#{user11.username}.png", content_type: 'image/png')
user11.save!

url = "https://randomuser.me/api/?nat=br"
user_serialized = URI.open(url).read
random_user = JSON.parse(user_serialized)
profile_pic = URI.open(random_user['results'][0]['picture']['medium'])

user12 = User.new(
  email: Faker::Internet.email,
  password: '123456',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: 'Rua Barão de Mesquita 314',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
  genres_attributes: {
    "0" => { name: Genre::GENRES.sample }
    }
  )

user12.photo.attach(io: profile_pic, filename: "#{user12.username}.png", content_type: 'image/png')
user12.save!

url = "https://randomuser.me/api/?nat=br"
user_serialized = URI.open(url).read
random_user = JSON.parse(user_serialized)
profile_pic = URI.open(random_user['results'][0]['picture']['medium'])

10.times do
  url = "https://randomuser.me/api/?nat=br"
  user_serialized = URI.open(url).read
  random_user = JSON.parse(user_serialized)
  profile_pic = URI.open(random_user['results'][0]['picture']['medium'])

  user = User.new(
    email: random_user['results'][0]['email'],
    password: '123456',
    username: random_user['results'][0]['login']['username'],
    first_name: random_user['results'][0]['name']['first'],
    last_name: random_user['results'][0]['name']['last'],
    address: "#{random_user['results'][0]['location']['street']['name']} #{random_user['results'][0]['location']['street']['number']}",
    description: Faker::GreekPhilosophers.quote,
    skills_attributes: {
      "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    },
    genres_attributes: {
      "0" => { name: Genre::GENRES.sample }
    }
    )

  user.photo.attach(io: profile_pic, filename: "#{user.username}.png", content_type: 'image/png')
  user.save!

  puts "Saved #{user.username}"
end

puts 'All done!'

