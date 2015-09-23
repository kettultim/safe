class MenuItem < ActiveRecord::Base
  belongs_to :menu
  validates_presence_of :link_label
  validates_presence_of :link_url
  validates_presence_of :menu_id
  validates_numericality_of :weight, only_integer: true

  scope :ordered, ->{ order(:weight) }

  before_validation :assign_weight

  private

  def assign_weight
    if menu && !weight
      self.weight = menu.items.count + 1
    end
  end
end
