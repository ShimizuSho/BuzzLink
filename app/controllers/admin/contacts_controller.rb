class Admin::ContactsController < ApplicationController

	def index
		@contacts = Contact.page(params[:page]).per(30).reverse_order
	end

	def destroy
		@contact = Contacts.find(params[:id])
		@contacts.delete
		redirect_to admin_contacts_path
	end

end
