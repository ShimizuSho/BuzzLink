class Admin::ContactsController < ApplicationController

	def index
		@contacts = Contact.page(params[:page]).per(5).reverse_order
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.delete
		redirect_to admin_contacts_path
	end
end
