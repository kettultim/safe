class MenuItem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :parent, class_name: 'MenuItem'

  has_many :items, foreign_key: :parent_id, class_name: 'MenuItem'

  validates_presence_of :link_label
  validates_presence_of :link_url
  validates_presence_of :menu_id
  validates_numericality_of :weight, only_integer: true

  scope :ordered, ->{ order(:weight) }
  scope :top_level, ->{ where(parent_id: nil) }

  before_validation :assign_menu_id
  before_validation :assign_weight

  def children
    result = []

    items.ordered.each do |item|
      result << [item, item.children]
    end

    result
  end

  def level
    parent_id == nil ? 0 : 1 + parent.level
  end

  private

  def assign_weight
    if menu && !weight
      self.weight = menu.items.count + 1
    end
  end

  def assign_menu_id
    if !menu && parent
      self.menu = parent.menu
    end
  end
end
