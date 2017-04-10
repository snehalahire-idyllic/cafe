# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
locality_list = ["Aundh","Camp","Kothrud","Deccan","Kharadi","Pashan"]
restaurant_names = ["Cream Corner","Gorge","Blue Nile","Chaitnya","Marzorin","Rolls Mania","Priya","CCD","Emali","Chinese Room","Chung fa"]
rating = [1,2,3,4,5]
rates =[100,50,250,500,700,245]
menu_data = {"Soups" => "Veg and NonVeg Soups",
	         "Salads" => "Salads with tomato,onion",
	         "Indian" => "Indian veg & Nonveg marinated with yogurt,indian spices",
	         "Asian" => "Asian including starters",
	         "Desserts & Beverages" => "Ice creams,milk shakes,Juices,lassi"}
items = {
	     "Chicken Tikka" => 6,
	     "Mix Veg Gravy" => 1,
	     "Palak Paneer" => 1,
	     "Aloo Matar" => 1,
	     "Mutton Biryani" => 1,
	     "Chicken hariyali kabab" =>3,

	     }
# items = {
# 	     "Chicken Tikka" => "chicken marinated with yogurt,indian spices and grilled in tandoori",
# 	     "Mix Veg Gravy" => "Assorted veg cooked in rich gravy",
# 	     "Palak Paneer" => "Paneer cooked in spinach puree",
# 	     "Aloo Matar" => "Potato cubes cooked with green peas",
# 	     "Mutton Biryani" => "Slow cooked chunks of mutton cooked with basmati rice"
# 	     }	     

restaurant_names.each do |name|
	r = Restaurant.create(name: name, locality: locality_list.sample, ratings: rating.sample)
	3.times do |name,description|
		mname = menu_data.keys.sample
	    m = Menu.create(name: mname , description: menu_data[mname], restaurant_id: r.id)
	    #if m.name == "Indian"
	    	3.times do |n|
	    		iname = items.keys.sample
	    		Item.create(name: iname, rate: rates.sample, quantity: items[iname],menu_id: m.id)
	    	end
	    #end
    end
end
 