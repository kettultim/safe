require 'test_helper'

feature 'Admin Update Menu Item Parent' do
  let(:admin) { create(:admin) }

  before do
    @menu = create(:two_level_menu)
    @menu_item = @menu.items.top_level.first
    @parent = @menu.items.top_level.second

    login_as admin
    visit admin_index_path

    within '#main' do
      click_link 'Menus'
    end

    within ".menu-#{@menu.id}" do
      click_link 'Manage Items'
    end

    within ".menu-item-#{@menu_item.id}" do
      click_link 'Edit'
    end

    select @parent.link_label, from: 'Parent'
    click_button 'Update Menu Item'

    @menu_item.reload
  end

  scenario 'it updates the parent item' do
    @menu_item.parent.must_equal @parent
  end
end
