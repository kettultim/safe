require 'test_helper'

feature 'Admin Page Creation' do
  let(:admin) { create(:admin) }

  before do
    login_as admin
    visit root_path
    click_link 'Pages'
    click_link 'New Page'

    fill_in 'Title', with: 'Foo'
    fill_in 'Body', with: 'Bar'

    click_button 'Create Page'

    @page = Page.last
  end

  scenario 'it sets the page title' do
    @page.title.must_equal 'Foo'
  end

  scenario 'it sets the page body' do
    @page.body.must_equal 'Bar'
  end

  scenario 'it redirects to the new page' do
    current_path.must_equal page_path(@page)
  end
end
