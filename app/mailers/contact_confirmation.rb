class ContactConfirmation < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_confirmation.receipt.subject
  #
  def receipt(contact)
    @contact = contact

    mail to: 's.johnwatson@gmail.com',
      subject: contact.subject
  end
end
