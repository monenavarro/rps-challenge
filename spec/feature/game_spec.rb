require 'spec_helper'

feature 'playing a game' do
  before do
    visit '/'
    fill_in 'name', with: 'Monica'
    click_button 'Submit'
  end

  scenario 'see choices' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  scenario 'choose rock, paper or scissors' do
    click_button 'Rock' 
    expect(page).to have_content "You chose Rock!"
  end
end