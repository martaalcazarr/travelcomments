# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
until Country.count == 20 do
    country = Country.new(name: Faker::Address.country)
    if !Country.pluck(:name).include?(country.name)
      country.save
    end
  end
  
countries = Country.all

until Article.count == 100 do
    Article.create(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    when_went: Faker::Date.between(from: 10.years.ago, to: Date.today),
    country_id: countries.sample.id
    )
end
