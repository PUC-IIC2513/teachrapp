# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = (1..50).map do |i|
  User.create(
    first_name: "Raúl #{i}",
    last_name: "Devés #{i}",
    email: "raul#{i}@ing.puc.cl",
    password: 'dalomismo',
    role: 'profesor'
  )
end

tags = (1..20).map do |i|
  Tag.create(
    name: "tag #{i}"
  )
end

resources = (1..20).map do |i|
  Resource.create(
    name: "clase #{i}",
    tags: tags.sample(5),
    user: users.sample(1).first
  )
end

announcements = (1..20).map do |i|
  Announcement.create(
    title: "Anuncio #{i}",
    content: "Lorem Ipsum #{i}",
    user: users.sample(1).first
  )
end
