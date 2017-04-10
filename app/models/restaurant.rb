class Restaurant < ApplicationRecord
  has_many :menus
  validates_presence_of :name,:ratings,:locality

  def self.search_by_name(name)
    if name
      Restaurant.where("name like?","%#{name}%")
    end
  end

  def self.search_by_locality(pattern)
    if pattern
      Restaurant.where("locality like?","%#{pattern}%")
    end
  end

  def self.search_by_item(pattern)
    if pattern
      Restaurant.includes(menus:[:items])
      .references(menus:[:items])
      .where("items.name LIKE '%#{pattern}%'")
    end
  end

  def self.search_by_rating(rating)
    if rating
      Restaurant.where("ratings >2")
    end
  end


  def self.search_by_rest(id)
    menu=Restaurant.find(id).menus
    menu.each do |x|
      x.items.each do |y|
        puts y.name
      end
    end
  end

  def self.search_by(addr,rating,item_name)
    Restaurant.includes(menus:[:items])
    .references(menus:[:items])
    .where(" items.name LIKE ? AND restaurants.locality like ? AND restaurants.ratings > ?", '%#{item_name}%', "%#{addr}%","#{rating}")
  end

end
