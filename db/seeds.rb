# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

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
    }
  )

user2.save!

user3 = User.new(
  email: 'carla@valdivia.com',
  password: '123456',
  username: 'carlavaldivia',
  first_name: 'Carla',
  last_name: 'Valdivia',
  address: 'Rua São Clemente 272',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    }
  )

user3.save!

user4 = User.new(
  email: 'luca@severo.com',
  password: '123456',
  username: 'lucasevero',
  first_name: 'Luca',
  last_name: 'Severo',
  address: 'Rua Santa Clara 33',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    }
  )

user4.save!

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
    }
  )

user5.save!

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
    }
  )

user6.save!


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
    }
  )

user7.save!


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
    }
  )

user8.save!


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
    }
  )

user9.save!

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
    }
  )

user10.save!

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
    }
  )

user11.save!

user12 = User.new(
  email: Faker::Internet.email ,
  password: '123456',
  username: Faker::Internet.username,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: 'Rua Barão de Mesquita 314',
  description: Faker::GreekPhilosophers.quote,
  skills_attributes: {
    "0" => { experience: Skill::EXPERIENCE.sample , instrument: Skill::INSTRUMENTS.sample }
    }
  )

user12.save!




puts 'All done!'

