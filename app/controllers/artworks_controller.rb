class ArtworksController < ApplicationController
	
	#http_basic_authenticate_with name: "aidan", password: "jbsuccsuck", except: [:index, :show]

	def index
		@artworks = Artwork.all
	end

	def show
		@artwork = Artwork.find(params[:id])
	end

	def new
		@artwork = Artwork.new
	end

	def edit
		@artwork = Artwork.find(params[:id])
	end

	def create
		@artwork = Artwork.new(article_params)

		if @artwork.save
			redirect_to @artwork
		else
			render 'new'
		end
	end

	def update
		@artwork = Artwork.find(params[:id])

		if @artwork.update(article_params)
			redirect_to @artwork
		else
			render 'edit'
		end
	end

	def destroy
		@artwork = Artwork.find(params[:id])
		@artwork.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:artwork).permit(:title, :description)
		end
end
