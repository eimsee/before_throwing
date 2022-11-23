# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Product.destroy_all
User.destroy_all

users = [
  { first_name: 'Jean', last_name: 'Valjean', email: 'jean@test.com', password: '123456' },
  { first_name: 'Javert', last_name: 'Christian', email: 'javert@live.fr', password: '123456' },
  { first_name: 'Cosette', last_name: 'Albert', email: 'cosette@live.fr', password: '123456' },
  { first_name: 'Marius', last_name: 'Franck', email: 'marius@gmail.com', password: '123456' },
  { first_name: 'Enjolras', last_name: 'Geraldine', email: 'enjolras@gmail.com', password: '123456' },
  { first_name: 'Fantine', last_name: 'Marie', email: 'fantine@gmail.com', password: '123456' },
]

users.each do |user|
  User.create!(user)
end
puts "Creating products..."
products = [
  { name: "chaise", description: "moisissure et peinture délavé", address: "Avenue Jean Marie Serrault, Fort de France, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "table", description: "moisissure", address: "Route de l'Enclos,Schoelcher, Martinique ", state: 'mauvais', user: User.all.sample },
  { name: "lit", description: "manque les bateaux", address: "Rue Victor Severe, Case Pilote, Martinique", state: 'moyen', user: User.all.sample },
  { name: "console", description: "très abimé", address: "Rue Camille Sylvestre, Le Lamentin, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "chaise", description: "capitonnage et dossier à retaper", address: "Avenue Felix Eboué, Ducos, Martinique", state: 'moyen', user: User.all.sample },
  { name: "chaise", description: "capitonnage a refaire", address: "Rue des Grottes,Trois Ilets, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "table_basse", description: "teinture et vernis abimé", address: "Rue Lamartine, Sainte Luce, Martinique", state: 'bon', user: User.all.sample },
  { name: "table de chevet", description: "brulé", address: "Rue Damas, Saint Pierre, Martinique", state: 'moyen', user: User.all.sample },
  { name: "commode", description: "en piece détaché", address: "Rue Victor Hugo, Saint Joseph, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "fauteuil", description: "coussin a refaire, structure assise cassée", address: "Rue Blenac, Fort de France, Martinique", state: 'mauvais', user: User.all.sample }
]

photos = [
  'public/seeds/chaise (2).jpg',
  'public/seeds/table moisissure.jpg',
  'public/seeds/lit.jpg',
  'public/seeds/console.jpg',
  'public/seeds/chaise.jpg',
  'public/seeds/chaise 3.jpg',
  'public/seeds/table basse.jpg',
  'public/seeds/chevet brule.jpg',
  'public/seeds/commode.jpg',
  'public/seeds/fauteuil.jpg',

]

products.each_with_index do |product, index|
  product = Product.create!(product)
  product.photo.attach(io: File.open(Rails.root.join(photos[index])), filename: 'photo.jpg', content_type: 'image/jpg')
  puts "Created #{product.name}"
end
puts "Finished!"
