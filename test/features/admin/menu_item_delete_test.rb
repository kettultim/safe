require 'test_helper'

feature 'Admin Update Menu Item' do
  let(:admin) { create(:admin) }

  before do
    @menu = create(:menu_with_items)
    @menu_item = @menu.items.first

    login_as admin
    visit admin_index_path
    click_link 'Menus'

    within ".menu-#{@menu.id}" do
      click_link 'Manage Items'
    end

    within ".menu-item-#{@menu_item.id}" do
      click_link 'Delete'
    end

    @menu.reload
  end

  scenario 'it deletes the item' do
    MenuItem.find_by_id(@menu_item.id).must_equal nil
  end

  scenario 'it redirects to the menu item index' do
    current_path.must_equal admin_menu_items_path(@menu)
  end
end
