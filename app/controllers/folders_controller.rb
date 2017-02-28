class FoldersController < ApplicationController

  before_action :authenticate_user!

  def create
    if user_verified?
      @folder = current_user.folders.new(folder_params)
      if @folder.save
        redirect_to user_path(current_user)
      else
        render :new
      end
    else
      whoops
    end
  end

  def new
    if user_verified?
      @folder = current_user.folders.build
    else
      whoops
    end
  end

  def update
    if user_verified?
      @folder = Folder.find_by_id(params[:id])
      if @folder.update(folder_params)
        redirect_to user_path(current_user)
      else
        render :edit
      end
    else
      whoops
    end
  end

  def edit
    if user_verified?
      @folder = Folder.find_by_id(params[:id])
    else
      whoops
    end
  end

  def show
    if user_verified?
      @folder = Folder.find_by_id(params[:id])
      @study_sets = @folder.study_sets
    else
      whoops
    end
  end

  def destroy
    if user_verified?
      @folder = Folder.find_by_id(params[:id])
      @folder.destroy
      flash[:notice] = "#{@folder.name} successfully destroyed"
      redirect_to user_path(current_user)
    else
      whoops
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:name, :study_set_ids => [])
  end
end
