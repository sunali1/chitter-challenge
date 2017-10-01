feature "I can sign up for Chitter" do
  scenario "sign up as new user" do
    expect { sign_up }.to change(User, :count).by(1)
    #expect(page).to have_content('WELCOME TO CHITTER')
    expect(User.first.email).to eq('trump@usa.com')
  end
#   scenario "I can log in again" do
#     expect{sign_in(password_confirmation: 'wrong')}.not_to change(User, :count)
#   end
#   scenario "Passwords don't match" do
#     expect{sign_in(password_confirmation: 'wrong')}.not_to change(User, :count)
#     expect(current_path).to eq('/users')
#     expect(page).to have_content "Passwords don't match!"
#   end
  end
