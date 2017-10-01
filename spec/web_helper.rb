def sign_up
    visit '/users/new'
    fill_in :email,    with: "trump@usa.com"
    fill_in :password, with: "1234"
    # user_params
    click_button 'Sign up'
end

def sign_in(email: "trump@usa.com",
            password: "1234",
            password_confirmation: "124")
    visit '/users/new'
    fill_in :email,    with: 'email'
    fill_in :password, with: "1234"
    fill_in :password_confirmation, with: "124"
    # user_params
    click_button 'Log in'
end

# def user_params
#   # fill_in :username, with: user.username
#   # fill_in :name,     with: user.name
#
#   #
# end
