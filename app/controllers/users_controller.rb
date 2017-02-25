class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @user = User.find_by_id(params[:id])
    if user_signed_in? && current_user
      @user = current_user
    end
    @study_sets = @user.study_sets
    @folders = @user.folders
  end
end
