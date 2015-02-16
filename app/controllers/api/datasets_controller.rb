module Api
  class DatasetsController < ApplicationController

    #this is temp,
    def index
      @datasets = Dataset.all
      render json: @datasets, each_serializer: DatasetSerializer, root: false
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_params
      params.require(:prediction).permit(:name,:email)
    end
  end
end
