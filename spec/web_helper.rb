def sign_up
    visit '/users/new'
    fill_in :email,    with: "trump@usa.com"
    fill_in :password, with: "1234"
    # user_params
    click_button 'Sign up'
end

# def user_params
#   # fill_in :username, with: user.username
#   # fill_in :name,     with: user.name
#
#   # fill_in :password_confirmation, with: user.password_confirmation
# end
