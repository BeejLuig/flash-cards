class FoldersController < ApplicationController
  def create
    folder = current_user.folders.new(name: folder_params[:name])
    study_set_ids = folder_params[:study_set_ids]
    study_set_ids.each do |set_id|
      if !set_id.blank?
        folder.study_sets << StudySet.find_by_id(set_id)
      end
    end
    folder.save
    redirect_to user_path(current_user)
  end

  def new
    @folder = current_user.folders.build
  end

  def update
    @folder = Folder.find_by_id(params[:id])
    study_sets = study_sets = folder_params[:study_set_ids].map { |set_id| StudySet.find_by_id(set_id) }.compact
    if @folder.update(name: folder_params[:name], study_sets: study_sets)
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
  end

  def destroy
    @folder = Folder.find_by_id(params[:id])
    @folder.destroy
    flash[:notice] = "#{@folder.name} successfully destroyed"
    redirect_to user_path(current_user)
  end

  def index
  end

  private
  def folder_params
    params.require(:folder).permit(:name, :study_set_ids => [])
  end
end
