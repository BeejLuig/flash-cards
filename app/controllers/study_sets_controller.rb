class StudySetsController < ApplicationController

  def create
    
  end

  def update
  end

  def index
    @study_sets = StudySet.all
  end

  def new
  end

  def show
    @study_set = StudySet.find_by_id(params[:id])
    @flash_cards = @study_set.flash_cards
  end

  def edit
  end

  def destroy
  end
end
