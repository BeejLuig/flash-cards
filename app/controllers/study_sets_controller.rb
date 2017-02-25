class StudySetsController < ApplicationController

  def create
    @study_set = current_user.study_sets.new(title: study_set_params[:title], description: study_set_params[:description])
    @study_set.owner = current_user
    @study_set.users << current_user
    study_set_params[:flash_cards_attributes].each do |key, flash_card|
      card = @study_set.flash_cards.new(term: flash_card[:term], definition: flash_card[:definition])
      card.study_set = @study_set
      card.save
    end
    if @study_set.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
  end

  def index
    @study_sets = StudySet.all
  end

  def new
    @study_set = current_user.study_sets.build
  end

  def show
    @study_set = StudySet.find_by_id(params[:id])
    @flash_cards = @study_set.flash_cards
  end

  def edit
  end

  def destroy
  end

  def add_flash_card
    render :new
  end

  private

  def study_set_params
    params.require(:study_set).permit(:title, :description, :flash_cards_attributes => [:term, :definition, :_destroy, :id])
  end
end
