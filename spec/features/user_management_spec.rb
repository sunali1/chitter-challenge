feature "I can sign up for Chitter" do
  scenario "sign up as new user" do
    expect{sign_up}.to change(User, :count).by(1)
    # expect(page).to have_content('WELCOME TO CHITTER')
    expect(User.first.email).to eq('trump@usa.com')
  end
end
