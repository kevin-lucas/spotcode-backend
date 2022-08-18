class Api::V1::FavoritesController < ApplicationController
    before_action :authenticate_api_user!, expect: [:index]

    def index
        @favorites_albums = current_api_user.favorites.where(favoritable_type: "Album").map(&:favoritable)
        @favorites_songs = current_api_user.favorites.where(favoritable_type: "Song").map(&:favoritable)
        @favorites_artists = current_api_user.favorites.where(favoritable_type: "Artist").map(&:favoritable)

        render json: @favorites_albums
    end

    def create
        current_api_user.favorites.create(favoritable_type: params[:favoritable_type], favoritable_id: params[:id])
        head :ok
    end

    def destroy
        @favoritable = current_api_user.favorites.find_by(favoritable_type: params[:favoritable_type], favoritable_id: params[:id])
        @favoritable.destroy
        head :ok
    end
end
