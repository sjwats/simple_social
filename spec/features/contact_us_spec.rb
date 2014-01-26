require 'spec_helper'

feature 'visitor can contact site staff' do
  scenario 'user can fill out and submit contact form' do
    ActionMailer::Base.deliveries = []

    prev_count = Contact.count
    visit '/'
    click_link 'Contact Us'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Watson'
    within '.input.contact_email' do
      fill_in 'Email', with: 'john@watson.com'
    end
    fill_in 'Subject', with: 'Subject line'
    fill_in 'Description', with: 'Extremely detailed description'
    click_button 'Submit Contact Form'
    expect(page).to have_content('Submission successful. Somebody will get back to you shortly.')
    expect(Contact.count).to eql(prev_count + 1)

    #expect email details pertaining to the contact confirmation
    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Subject line')
    expect(last_email).to deliver_to('s.johnwatson@gmail.com')
    expect(last_email).to have_body_text(/John Watson/)
    expect(last_email).to have_body_text(/Extremely detailed/)

  end

  scenario 'with invalid attributes' do
    visit new_contact_path
    click_button 'Submit Contact Form'
    expect(page).to_not have_content('Submission successful. Somebody will get back to you shortly.')
    within '.input.contact_first_name' do
      expect(page).to have_content("can't be blank")
    end
    within '.input.contact_last_name' do
      expect(page).to have_content("can't be blank")
    end
    within '.input.contact_email' do
      expect(page).to have_content("can't be blank")
    end
    within '.input.contact_subject' do
      expect(page).to have_content("can't be blank")
    end
    within '.input.contact_description' do
      expect(page).to have_content("can't be blank")
    end
  end


end
