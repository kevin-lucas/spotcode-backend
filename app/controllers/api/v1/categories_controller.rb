class Api::V1::CategoriesController < ApplicationController
    before_action :authenticate_api_user!, expect: [:index]

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end

end
