class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to profiles_path, notice: 'Submission successful. Somebody will get back to you shortly.'
    else
      render :new
    end
  end

  protected

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :subject, :description)
  end
end
