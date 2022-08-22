class Api::V1::RecentlyHeardsController < ApplicationController
    before_action :authenticate_api_user!, expect: [:create]

    def create
        current_api_user.recently_heards.create(album_id: params[:album_id])
        head :ok
    end
end
