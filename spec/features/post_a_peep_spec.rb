feature "I can post a peep" do
  scenario 'post a peep' do
    visit '/peeps/new'
    # click_button 'Pen'
    fill_in :peep, with: 'My first peep!'
    click_button 'Send'
    expect(page).to have_content('My first peep!')
  end
end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
#
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter