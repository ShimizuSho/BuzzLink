class User::ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.save
		redirect_to user_contact_completed_path(current_user.id)
	end

private
	def contact_params
		params.require(:contact).permit(:name, :email, :contact_body)
	end


end

