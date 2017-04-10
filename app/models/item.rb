class Item < ApplicationRecord
  belongs_to :menu
  def self.search(pattern)
    #    if pattern.blank?  # blank? covers both nil and empty string
    #   all
    # else
    @item_search=Item.where('name LIKE ?', "%#{pattern}%")

    #end
  end


end
