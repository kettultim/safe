class Menu < ActiveRecord::Base
  has_many :items, class_name: 'MenuItem', dependent: :destroy

  def nested_items
    result = []

    items.top_level.ordered.each do |item|
      result << [item, item.children]
    end

    result
  end
end
