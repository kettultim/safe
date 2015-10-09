require 'test_helper'

feature 'Viewing a Page' do
  before do
    visit page_path(custom_page)
  end

  describe 'published page' do
    let(:custom_page) { create(:page) }

    scenario 'it shows the page title and body' do
      page.must_have_content custom_page.title
      page.html.must_include custom_page.body
    end
  end

  describe 'unpublished page' do
    let(:admin) { create(:admin) }
    let(:custom_page) { create(:unpublished_page) }

    describe 'as an admin' do
      before do
        login_as admin
        visit page_path(custom_page)
      end

      it 'shows not published' do
        page.must_have_content custom_page.title
        page.html.must_include custom_page.body
        page.must_have_content 'not published'
      end
    end

    describe 'as an annonymous user' do
      scenario 'it redirects' do
        current_path.wont_equal page_path(custom_page)
      end
    end
  end

end
