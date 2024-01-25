class UploaderController < ApplicationController
  skip_forgery_protection
  def image
    blob = ActiveStorage::Blob.create_and_upload!(
	      io:           params[:file],
	      filename:     params[:file].original_filename,
	      content_type: params[:file].content_type
	    )
	    # render json: {location: url_for(blob)}, content_type: "text/html"
      # Renvoyer l'URL de l'image dans le format attendu par TinyMCE.
    render json: { location: url_for(blob) }, content_type: "application/json"
  end
end
