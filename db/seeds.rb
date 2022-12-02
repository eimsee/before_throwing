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
Booking.destroy_all
users = [
  { first_name: 'Marie-christine', last_name: 'Morvany', email: 'eimsee_eesmie@live.fr', password: '123456' },
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
  { name: "CHAISE", description: "moisissure et peinture délavé", address: "Avenue Jean Marie Serrault, Fort de France, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "TABLE", description: "moisissure", address: "Route de l'Enclos,Schoelcher, Martinique ", state: 'mauvais', user: User.all.sample },
  { name: "LIT", description: "manque les bateaux", address: "Rue Victor Severe, Case Pilote, Martinique", state: 'moyen', user: User.all.sample },
  { name: "CONSOLE", description: "très abimé", address: "Rue Camille Sylvestre, Le Lamentin, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "CHAISE", description: "capitonnage et dossier à retaper", address: "Avenue Felix Eboué, Ducos, Martinique", state: 'moyen', user: User.all.sample },
  { name: "CHAISE", description: "capitonnage a refaire", address: "Rue des Grottes,Trois Ilets, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "TABLE BASSE", description: "teinture et vernis abimé", address: "Rue Lamartine, Sainte Luce, Martinique", state: 'bon', user: User.all.sample },
  { name: "TABLE DE CHEVET", description: "brulé", address: "Rue Damas, Saint Pierre, Martinique", state: 'moyen', user: User.all.sample },
  { name: "COMMODE", description: "en piece détaché", address: "Rue Victor Hugo, Saint Joseph, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "FAUTEUIL", description: "coussin a refaire, structure assise cassée", address: "Rue Blenac, Fort de France, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "CHAISE", description: "capitonnage à refaire plus fond", address: "40 Rue des Poinsettias, Ducos, Martinique", state: 'moyen', user: User.all.sample },
  { name: "COMMODE", description: "peinture abimée", address: "10 Rue Jules Monnerot, Fort de France, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "ÉTAGERE", description: "tiroir à refaire plus vernis", address: "14 Rue Bernard Boromé, Schoelcher, Martinique", state: 'moyen', user: User.all.sample },
  { name: "FAUTEUIL", description: "capitonnage à refaire", address: "18 Rue de Gros Raisin, Saint-Luce, Martinique", state: 'mauvais', user: User.all.sample },
  { name: "MEUBLE TÉLÉ", description: "vernis abimé, fond à refaire", address: "38 Rue André Guédon, Le Lamentin, Martinique", state: 'moyen', user: User.all.sample },
  { name: "PORTE VITRÉE", description: "vitre en bon état, structure rouillée, peinture à refaire ", address: "16 Rue Perrinon, Carbet, Martinique", state: 'moyen', user: User.all.sample }
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
  'public/seeds/chaise blanche.jpg',
  'public/seeds/commode4.jpg',
  'public/seeds/etagere.jpg',
  'public/seeds/fauteuils.jpg',
  'public/seeds/meubletélé.jpg',
  'public/seeds/vitre.jpg',

]

products.each_with_index do |product, index|
  product = Product.create!(product)
  product.photo.attach(io: File.open(Rails.root.join(photos[index])), filename: 'photo.jpg', content_type: 'image/jpg')
  puts "Created #{product.name}"
end
puts "Finished!"
