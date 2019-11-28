class User::ContactsController < ApplicationController
	before_action :authenticate_user!

	def new
		@contact = Contact.new
	end
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to user_contact_completed_path(current_user.id)
		else
	     	@contact = Contact.new
	      	render 'user/contacts/new'
      	end
	end

	private
		def contact_params
			params.require(:contact).permit(:name, :contact_body)
		end
end

