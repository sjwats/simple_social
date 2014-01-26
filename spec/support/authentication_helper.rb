module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    within '.signin' do
      within '.input.user_email' do
        fill_in 'Email', with: user.email
      end
      fill_in 'Password', with: user.password
      click_on "Login"
    end
  end
end
