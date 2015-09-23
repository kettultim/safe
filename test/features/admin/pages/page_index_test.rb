require 'test_helper'

feature 'Admin Page Management' do
  let(:admin) { create(:admin) }

  before do
    @custom_page = create(:page)

    login_as admin
    visit root_path
    click_link 'Pages'
  end

  scenario 'it lists all pages' do
    page.must_have_content @custom_page.title
  end
end
