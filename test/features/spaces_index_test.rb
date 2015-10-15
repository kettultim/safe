require 'test_helper'

feature 'Space index' do
  let(:user) { create(:guest) }
  let(:space) { create(:space) }

  setup do
    space

    login_as user
    visit root_path
    click_link 'Find a Safe Space'
  end

  scenario 'It lists the spaces' do
    page.must_have_content space.name
  end
end
