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
      click_link 'Edit'
    end

    fill_in 'Link label', with: 'Foo'
    fill_in 'Link url', with: 'http://google.com'
    click_button 'Update Menu Item'

    @menu_item.reload
  end

  scenario 'it updates the link url' do
    @menu_item.link_url.must_equal 'http://google.com'
  end

  scenario 'it updates the link label' do
    @menu_item.link_label.must_equal 'Foo'
  end

  scenario 'it redirects to the menu item index' do
    current_path.must_equal admin_menu_items_path(@menu)
  end
end
