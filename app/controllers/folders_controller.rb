class FoldersController < ApplicationController
  def create
    @folder = current_user.folders.new(folder_params)
    if @folder.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def new
    @folder = current_user.folders.build
  end

  def update
    @folder = Folder.find_by_id(params[:id])
    if @folder.update(folder_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def edit
    @folder = Folder.find_by_id(params[:id])
  end

  def show
    @folder = Folder.find_by_id(params[:id])
    @study_sets = @folder.study_sets
  end

  def destroy
    @folder = Folder.find_by_id(params[:id])
    @folder.destroy
    flash[:notice] = "#{@folder.name} successfully destroyed"
    redirect_to user_path(current_user)
  end

  private
  def folder_params
    params.require(:folder).permit(:name, :study_set_ids => [])
  end
end
