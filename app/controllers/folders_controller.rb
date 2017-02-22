class FoldersController < ApplicationController
  def create
    binding.pry
    current_user.folders.new(name: folder_params[:name])
    redirect_to user_path(current_user)
  end

  def new
  end

  def update
  end

  def edit
  end

  def show
  end

  def destroy
  end

  def index
  end

  private
  def folder_params
    params.require(:folder).permit(:name, :study_set_ids => [])
  end
end
