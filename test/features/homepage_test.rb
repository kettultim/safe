require 'test_helper'

feature 'Homepage Integration' do
  scenario 'displays a welcome message' do
    visit root_path
    page.must_have_content 'welcome'
  end
end
