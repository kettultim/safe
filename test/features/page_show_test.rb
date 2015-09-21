require 'test_helper'

feature 'Viewing a Page' do
  let(:custom_page) { create(:page) }

  before do
    visit page_path custom_page.friendly_id
  end

  scenario 'it shows the page title' do
    page.must_have_content custom_page.title
  end

  scenario 'it shows the page body' do
    page.html.must_include custom_page.body
  end
end
