class Api::V1::CategoriesController < ApplicationController
    before_action :authenticate_api_user!, expect: [:index]

    def index
        @categories = Category.all
        render json: @categories
    end

end
