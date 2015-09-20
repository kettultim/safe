require 'test_helper'

feature 'Homepage' do
  scenario 'it displays a welcome message' do
    visit root_path
    page.must_have_content 'welcome'
  end
end
