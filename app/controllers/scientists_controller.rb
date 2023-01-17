class ScientistsController < ApplicationController

    def index
        scientists = Scientist.all
        render json: scientists, status: :ok
    end

    def show
        scientist = set_scientist
        render json: scientist, serializer: ScientistWithPlanetsSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        if scientist
            render json: scientist, status: :created
        else
            render json: scientist.errors, status: :unprocessable_entity
        end
    end

    def update
        scientist = set_scientist
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = set_scientist
        scientist.destroy!
        head :no_content, status: :destroyed
    end





    private

    def set_scientist
        scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end
end
