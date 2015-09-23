require 'test_helper'

describe Menu do
  should have_many :items

  describe '#nested_items' do
    let(:menu) { create(:three_level_menu) }
    let(:nested_items) { menu.nested_items }

    it 'has multi levels' do
      nested_items[2][0].must_equal menu.items.last
    end
  end
end
