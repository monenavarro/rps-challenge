require 'spec_helper'

feature 'playing a game' do
  PLAY_SEED = 221563
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

  scenario 'opponent chooses "Rock"' do
    click_button 'Rock'
    message = find(:css, "#opponent").text.strip 
    expect(possible_messages).to include message
  end

  scenario 'oponent chooses a random option' do
    srand(PLAY_SEED)
    click_button 'Rock'
    expect(page).to have_content 'Opponent chose Scissors!'
  end

  def possible_messages
    [:Rock, :Paper, :Scissors].map { |shape| "Opponent chose #{shape}!" }
  end
end