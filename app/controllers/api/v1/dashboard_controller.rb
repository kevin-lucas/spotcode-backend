class Api::V1::DashboardController < ApplicationController
    def index
        load_recent_heard
        load_recommendations
    end

    private

    def load_recent_heard
        # recupero os albuns recentes ouvidos pelo usuario logado
        @recent_albums = current_api_user.recently_heards.order('created_at DESC').limit(4).map(&:album)
    end

    def load_recommendations
        # recupero as categorias dos albuns escutados recentemente pelo usuario
        heard_categories = @recent_albums.map(&:category)

        if heard_categories.present?
            # recomendo para o usuario albums que estejam nas categorias dos albuns escutados recentemente            
            @recommended_albums = Album.joins(:category, :songs).where(category: heard_categories).limit(12)
        else
            # Recomendo para o usuario albums aleatorios
            @recommended_albums = Album.sample.limit(12)
        end

        render json: @recommended_albums
    end
end
