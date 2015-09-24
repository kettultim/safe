class Menu < ActiveRecord::Base
  has_many :items, class_name: 'MenuItem', dependent: :destroy
end
