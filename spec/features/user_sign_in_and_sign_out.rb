# before(:each) do
#   User.create(email: 'test@test.com',
#               password: 'test',
#               password_confirmation: 'test')
# end
# feature 'User sign in' do
#     scenario 'with correct credentials' do
#     sign_in(email: user.email,   password: user.password)
#     expect(page).to have_content "Welcome, #{user.email}"
#   end
#
#   def sign_in(email:, password:)
#     visit '/sessions/new'
#     fill_in :email, with: email
#     fill_in :password, with: password
#     click_button 'Sign in'
#   end
# end
#
# feature 'user signs out' do
#   scenario 'while being signed in' do
#     sign_in(email: 'test@test.com', password: 'test')
#     click_button 'Sign out'
#     expect(page).to have_content('goodbye!')
#     expect(page).not_to have_content('Welcome, test@test.com')
#   end
#
# end
