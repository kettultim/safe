require 'test_helper'

feature 'Space index' do
  let(:user) { create(:guest) }
  let(:space) { Space.first }

  setup do
    10.times do
      create(:space)
    end

    login_as user
    visit root_path
    click_link 'Browse Spaces'
  end

  scenario 'It lists the spaces' do
    page.must_have_content space.name
  end
end
