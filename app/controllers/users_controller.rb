class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find_by_id(params[:id])
    @study_sets = @user.study_sets
    @folders = @user.folders
  end
end
