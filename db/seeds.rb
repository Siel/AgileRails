# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
#...
Product.create!(
	title: 'Harry Potter y la piedra filosofal',
	description: %{
		<p>
		Primer libro de la Saga de Harry Potter.
		</p>
	},
	image_url: 'hp1.jpg',
	price: 25.50
)
Product.create!(
	title: 'Harry Potter y la cámara secreta',
	description: %{
		<p>
		Segundo libro de la Saga de Harry Potter.
		</p>
	},
	image_url: 'hp2.jpg',
	price: 24.50
)