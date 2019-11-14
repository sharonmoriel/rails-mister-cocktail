require 'rest-client'

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating Magic Ingredients...'

result = RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
json = JSON.parse(result.body, symbolize_names: true)
Ingredients_arr = json[:drinks]
Ingredients_arr.each { |ing| Ingredient.create(name: ing[:strIngredient1]) }

puts 'Done!Yay!'
