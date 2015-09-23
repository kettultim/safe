require "test_helper"

describe MenuItem do
  should belong_to :menu
  should have_many :items
  should validate_presence_of :link_label
  should validate_presence_of :link_url
  should validate_numericality_of :weight

  it 'only allows integer weights' do
    subject.weight = 7.5
    subject.valid?
    subject.errors[:weight].wont_equal []
  end
end
