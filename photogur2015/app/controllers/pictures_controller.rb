class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
    # new only creates the local object but does not attempt to validate or save it to the DB.  Here, the local object is empty, since the user hasn't yet filled in the form on the new page with the picture's attributes.
    # An HTTP GET to /resources/new is intended to render a form suitable for creating a new resource, which it does by calling the new action within the controller, which creates a new unsaved record and renders the form.
  end

  def create
    @picture = Picture.new(picture_params)
    # create instantiates the new object, validates it, and then saves it to the database.
    # An HTTP POST to /resources takes the record created as part of the new action and passes it to the create action within the controller, which then attempts to save it to the database.
    if @picture.save
      redirect_to pictures_url
      # If the save for the picture was successful, go to index.html.erb (where the newly created picture will be visible as the last entry in the index of pictures).
    else
      render :new
      # Otherwise render the view associated with the action :new (i.e. new.html.erb)
      # If the picture could not be saved, return the user to the new picture form (render the page again) to try again (most likely, validations didn't pass due to user behavior).
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end
end
