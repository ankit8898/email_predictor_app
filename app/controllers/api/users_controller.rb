module Api
  class UsersController < ApplicationController


    # GET /users
    # GET /users.json
    def index
      @users = User.all
      render json: @users, each_serializer: UserSerializer,root: false
    end

    def create
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end
  end
end
