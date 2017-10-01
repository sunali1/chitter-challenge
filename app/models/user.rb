require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
class User

    include DataMapper::Resource

    property :id, Serial
    property :username, String
    property :name, String
    property :email, Text
    property :password_digest, Text

    def password=(password)
      self.password_digest = BCrypt::Password.create(password)
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
