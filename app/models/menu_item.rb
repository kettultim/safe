class MenuItem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :parent, class_name: 'MenuItem'

  has_many :items, foreign_key: :parent_id, class_name: 'MenuItem',
  dependent: :destroy

  validates_presence_of :link_label
  validates_presence_of :link_url
  validates_presence_of :menu_id
  validates_numericality_of :weight, only_integer: true

  scope :ordered, ->{ order(:weight) }
  scope :top_level, ->{ where(parent_id: nil) }

  before_validation :assign_weight

  private

  def assign_weight
    return if weight

    if parent
      self.weight = parent.items.count + 1
    elsif menu
      self.weight = menu.items.top_level.count + 1
    end
  end
end
