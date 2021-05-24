require 'rails_helper'

RSpec.describe "Static Page", type: :system do
  describe 'GET /' do
    before do
      visit '/'
    end

    it 'shows the root page' do
      expect(page).to(have_content('Welcome'))
    end

    it 'contains a link to sign up page' do
      expect(page).to(have_link('Sign Up', href: '/users/sign_up'))
    end

    it 'contains a link to sign in page' do
      expect(page).to(have_link('Sign In', href: '/users/sign_in'))
    end
  end
end
