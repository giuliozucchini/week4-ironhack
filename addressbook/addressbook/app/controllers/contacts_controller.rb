class ContactsController < ApplicationController

	  	def index
			@contacts = Contact.all
		end

		def list
		@contact = Contact.new
		end

		def new
			@contact = Contact.new
		end

	  def create
			@contact = Contact.new(contact_params)
		    if @contact.valid?
		      @contact.save
		      redirect_to '/contacts', notice: 'The contact was successfully created.'
		    else
		      render :new, notice: 'The contact is invalid. Try again.'
		    end
	   end

	  def show
      	@contact = Contact.find params[:id]
	  rescue ActiveRecord::RecordNotFound
      	render 'no_projects_found'
	  end

	  def destroy
	  	@contact = Contact.find params[:id]
	  	@contact.destroy
	  	redirect_to contacts_path
	  end

private

	   def contact_params
	    params.require(:contact).permit(:name, :phone, :email, :address)
	  end
	  
end
