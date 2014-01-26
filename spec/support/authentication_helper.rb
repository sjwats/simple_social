module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    within ".signin" do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on "Login"
    end
  end
end
