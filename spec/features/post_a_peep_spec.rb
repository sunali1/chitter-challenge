feature "I can post a peep" do
  scenario 'post a peep' do
    visit '/peeps/new'
    # click_button 'Pen'
    fill_in :peep, with: 'My first peep!'
    click_button 'Send'
    expect(page).to have_content('My first peep!')
  end
end
