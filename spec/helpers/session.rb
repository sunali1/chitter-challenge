module SessionHelpers

 def sign_in(email:, password:)
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Log in'
 end

 def sign_up(email: 'trump@usa.com',
             password: '1234',
             password_confirmation: '1234')
   visit '/users/new'
   fill_in :email, with: email
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign up'
 end

end
