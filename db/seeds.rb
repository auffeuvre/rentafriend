require "faker" # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Activity.destroy_all
User.destroy_all

puts "Start creating ..."

user1 = User.create(email: 'agnes@mail.com', name: 'ags', description: 'Looking for a friend', password: '123456')
user2 = User.create(email: 'florent@mail.com', name: 'flo', description: 'Suggest activities', password: '234567')

Activity.create(
  title: 'Cooking',
  description: 'Cooking lights pastries ',
  location: 'Paris',
  poster_url: 'empty',
  latitude: 48.862725,
  longitude: 2.287592,
  user_id: user1.id
)

Activity.create(
  title: 'Surfing',
  description: 'Introduction to surf basics',
  location: '45 Boulevard de Vaugirard, 75015 Paris, France',
  poster_url: 'empty',
  latitude: 48.840795205059,
  longitude: 2.31738532595453,
  user_id: user2.id
)
Activity.create(
  title: 'Music',
  description: 'Dj party with a set of 50min ',
  location: "4 Rue d'Avron, 75020 Paris, France",
  poster_url: 'empty',
  latitude: 48.8513299590573,
  longitude: 2.39916496556445,
  user_id: user1
)

Activity.create(
  title: 'Going for a walk',
  description: "42 Rue Victorien Sardou, 69007 Lyon 7e Arrondissement, France",
  location: Faker::Address.city,
  poster_url: 'empty',
  latitude: 45.7462456538984,
  longitude: 4.8545837,
  user_id: user2
)

Activity.create(
  title: 'Rock concert',
  description: 'Going to the transbordeur',
  location: "169 Avenue Franklin Roosevelt, 69120 Vaulx-en-Velin, France",
  poster_url: 'empty',
  latitude: 45.7514208091103,
  longitude: 4.93664436338489,
  user_id: user1
)

Activity.create(
  title: 'Playing cards',
  description: 'Play poker ',
  location: "132D Rue de la République, 69120 Vaulx-en-Velin, France",
  poster_url: 'empty',
  latitude: 45.7838408569418,
  longitude: 4.93195650788634,
  user_id: user2
)

Activity.create(
  title: 'Playing chess',
  description: 'Professional player with knowledge in strategic chess play ',
  location: "21 Rue d'Austerlitz, 69004 Lyon 4e Arrondissement, France",
  poster_url: 'empty',
  latitude: 45.7751181660203,
  longitude: 4.83526948822851,
  user_id: user1
)

Activity.create(
  title: 'Reading session',
  description: 'Read the classics of litterature',
  location: "91b Rue Émile Decorps, 69100 Villeurbanne, France",
  poster_url: 'empty',
  latitude: 45.7533118572327,
  longitude: 4.90031348327106,
  user_id: user2
)

Activity.create(
  title: 'Groceries shopping',
  description: 'Go to the supermaket together ',
  location: "9 Rue Boissac, 69002 Lyon 2e Arrondissement, France",
  poster_url: 'empty',
  latitude: 45.7560333207804,
  longitude: 4.83058163272996,
  user_id: user1
)

Activity.create(
  title: 'Bike promenade',
  description: 'Go biking in the city',
  location: "100 Rue de l'Industrie, 69800 Saint-Priest, France",
  poster_url: 'empty',
  latitude: 45.6922037290845,
  longitude: 4.923752760764,
  user_id: user2
)

puts "Done creating"
