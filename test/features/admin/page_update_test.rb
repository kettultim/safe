require 'test_helper'

feature 'Admin Page Update' do
  let(:admin) { create(:admin) }

  before do
    @page = create(:page)

    login_as admin
    visit root_path
    click_link 'Pages'

    within ".page-#{@page.id}" do
      click_link 'Edit'
    end

    fill_in 'Title', with: 'Foo'
    fill_in 'Body', with: 'Bar'
    uncheck 'page_published'

    click_button 'Update Page'

    @page.reload
  end

  scenario 'it sets the page title' do
    @page.title.must_equal 'Foo'
  end

  scenario 'it sets the page body' do
    @page.body.must_equal 'Bar'
  end

  scenario 'it unpublishes the page' do
    @page.wont_be :published?
  end

  scenario 'it redirects to the page' do
    current_path.must_equal admin_pages_path
  end
end
