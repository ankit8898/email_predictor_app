module Api
  class PredictionsController < ApplicationController

    def index
      @predictions = Prediction.all
      render json: @predictions, each_serializer: PredictionSerializer,root: false
    end

    def create
      logger.info(prediction_params)
      @prediction = Prediction.new(prediction_params)
      @prediction.save!

      logger.info "++++++++#{@prediction.inspect}"
      render json: @prediction,serializer: PredictionSerializer
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def prediction_params
      params.require(:prediction).permit(:name,:company)
    end
  end
end
