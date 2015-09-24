require 'test_helper'

feature 'Admin Page Delete' do
  let(:admin) { create(:admin) }

  before do
    @page = create(:page, published: false)

    login_as admin
    visit root_path
    click_link 'Pages'

    within ".page-#{@page.id}" do
      click_link 'Delete'
    end
  end

  scenario 'it deletes the page' do
    Page.find_by_id(@page.id).must_be_nil
  end

  scenario 'it soft deletes the page' do
    Page.only_deleted.find_by_id(@page.id).must_equal @page
  end

  scenario 'it redirects to the page index' do
    current_path.must_equal admin_pages_path
  end
end
