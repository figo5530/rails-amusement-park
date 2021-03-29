class AttractionsController < ApplicationController
    def new
        @a = Attraction.new
    end

    def create
        @a = Attraction.create(attraction_params)
        redirect_to attraction_path(@a)
    end
    
    def show
        @a = Attraction.find_by(id: params[:id])
        @user = current_user
        @ride = @a.rides.build(user_id: current_user.id)
    end

    def index
        @attractions = Attraction.all
        @user = current_user

    end

    def edit
        @a = Attraction.find_by(id: params[:id])
    end
    
    def update
        @a = Attraction.find_by(id: params[:id])
        @a.update(attraction_params)
        redirect_to attraction_path(@a)
    end
    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
end