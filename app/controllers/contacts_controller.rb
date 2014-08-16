class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = "Cool! Thanks!"
    else
      flash.now[:error] = "Crap!"
      render :new
    end
  end
end
