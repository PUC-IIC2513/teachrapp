# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = Project.create([
  { name: 'Librería de videojuegos', description: 'TODO' },
  { name: 'IoU', description: 'TODO' },
  { name: 'Bounty Hunters', description: 'TODO' }
])

repos = ['google/material-design-icons', 'davidsonfellipe/awesome-wpo', 'segmentio/nightmare', 'getify/You-Dont-Know-JS', 'facebook/osquery',
  'facebook/AsyncDisplayKit', 'kimmobrunfeldt/progressbar.js', 'ConnorAtherton/walkway', 'enaqx/awesome-react', 'SFTtech/openage', 'keen/dashboards',
  'aFarkas/lazysizes', 'sosedoff/pgweb', 'angular/angular.js', 'twbs/bootstrap', 'FezVrasta/bootstrap-material-design', 'fastos/fastsocket', 'google/physical-web', 'atom/atom',
  'vhf/free-programming-books', 'jonschlinkert/remarkable', 'meteor/meteor', 'github/fetch', 'haoel/leetcode', 'facebook/react']

count = 0
groups = repos.map do |repo|
  project = projects.sample(1).first
  group = Group.create(name: "Grupo #{count += 1}", project: project, git_repo: repo)
end

names = [
  'Zana Zinck',
  'Alfredia Annunziata',
  'Tiffiny To',
  'Margert Marty',
  'Tandra Theriault',
  'Numbers Nishimura',
  'Delphia David',
  'Sunshine Sicard',
  'Donnell Denbow',
  'Richard Rock',
  'Julissa Jobst',
  'Georgina Gilbreath',
  'Caridad Champlin',
  'Violeta Villacis',
  'Philip Pinkard',
  'Elvera Esh',
  'Pearlie Pellegrino',
  'Alla Addis',
  'Pamila Peart',
  'Yun Younger',
  'Cedric Cowart',
  'Kary Klassen',
  'Hoyt Hegland',
  'Liza Lamay',
  'Kizzy Klock',
  'Olevia Olive',
  'Isaac Isham',
  'Will Wetherington',
  'Jin Juliano',
  'Eun Ewers',
  'Ellan Eccles',
  'Magaret Moncayo',
  'Doris Dennen',
  'Scarlet Stoehr',
  'Lincoln Levario',
  'Joye Junker',
  'Theron Tibbits',
  'Katlyn Krok',
  'Beth Boutte',
  'Micheline Miler',
  'Annalee Adolphson',
  'Milagros Mcnitt',
  'Mitchel Mccarthy',
  'Carissa Carmouche',
  'Olga Oyola',
  'Melonie Maldanado',
  'Lizette Lightcap',
  'Simonne Schuett',
  'Francis Francoeur',
  'Sharyn Seavey'
]

group_count = -1
users = names.map do |name|
  first_name, last_name = name.split(' ')
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: "#{name.gsub(' ', '.')}@example.org".downcase,
    password: 'dalomismo',
    role: 'student',
    group: groups[(group_count += 1) / 2]
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
