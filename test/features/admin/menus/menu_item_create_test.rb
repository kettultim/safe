require 'test_helper'

feature 'Admin Update Menu Item' do
  let(:admin) { create(:admin) }

  before do
    @menu = create(:menu)

    login_as admin
    visit admin_index_path

    within '#main' do
      click_link 'Menus'
    end

    within ".menu-#{@menu.id}" do
      click_link 'Manage Items'
    end

    click_link 'New Menu Item'

    fill_in 'Link label', with: 'Foo'
    fill_in 'Link url', with: 'http://google.com'
    select '4', from: 'Weight'
    click_button 'Create Menu Item'

    @menu_item = @menu.items.last
  end

  scenario 'it sets the link url' do
    @menu_item.link_url.must_equal 'http://google.com'
  end

  scenario 'it sets the link label' do
    @menu_item.link_label.must_equal 'Foo'
  end

  scenario 'it sets the weight' do
    @menu_item.weight.must_equal 4
  end

  scenario 'it redirects to the menu item index' do
    current_path.must_equal admin_menu_items_path(@menu)
  end
end
