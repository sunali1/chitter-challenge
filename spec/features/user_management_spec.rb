feature "I can sign up for Chitter" do
  scenario "sign up as new user" do
    expect { sign_up }.to change(User, :count).by(1)
    #expect(page).to have_content('WELCOME TO CHITTER')
    expect(User.first.email).to eq('trump@usa.com')
  end
  scenario "I can log in again" do
    expect{sign_in(password_confirmation: 'wrong')}.not_to change(User, :count)
  end
end
# spec/web_helper.rb
# def sign_up
#   visit '/users/new'
#   expect(page.status_code).to eq(200)
#   fill_in :email,    with: 'alice@example.com'
#   fill_in :password, with: 'oranges!'
#   click_button 'Sign up'
# end
#
# # spec/features/user_management_spec.rb
# feature 'User sign up' do
#   scenario 'I can sign up as a new user' do
#     expect { sign_up }.to change(User, :count).by(1)
#     expect(page).to have_content('Welcome, alice@example.com')
#     expect(User.first.email).to eq('alice@example.com')
#   end
# end
