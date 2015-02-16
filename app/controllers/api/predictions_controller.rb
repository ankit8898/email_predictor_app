module Api
  class PredictionsController < ApplicationController

    def index
      @predictions = Prediction.all
      render json: @predictions, each_serializer: PredictionSerializer,root: false
    end

    def create
      @prediction = Prediction.new(prediction_params)
      if @prediction.predict_and_save
        render json: {data: PredictionSerializer.new(@prediction),message: 'success'}
      else
        render json: {data: @prediction, message: @prediction.errors.messages[:prediction].join(', ')}
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def prediction_params
      params.require(:prediction).permit(:name,:company)
    end
  end
end
