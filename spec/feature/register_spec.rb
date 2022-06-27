require 'spec_helper'

feature 'registering name' do 
  scenario 'register and see user name' do
    visit '/'
    fill_in 'name', with: 'Monica'
    click_button 'Submit'
    expect(page).to have_content 'Monica'
  end
end