class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @study_sets = current_user.study_sets
    @folders = current_user.folders
  end
end
