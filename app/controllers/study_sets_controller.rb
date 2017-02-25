class StudySetsController < ApplicationController

  def create
#    @study_set = current_user.study_sets.new(title: study_set_params[:title], description: study_set_params[:description])
#    @study_set.owner = current_user
#    @study_set.users << current_user
#    study_set_params[:flash_cards_attributes].each do |key, flash_card|
#      card = @study_set.flash_cards.new(term: flash_card[:term], definition: flash_card[:definition])
#      card.study_set = @study_set
#    end
    @study_set = current_user.study_sets.new(study_set_params)
    if current_user.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    @study_set = StudySet.find_by_id(params[:id])
    if @study_set.update(study_set_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
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
    @study_set = StudySet.find_by_id(params[:id])
    @flash_cards = @study_set.flash_cards
  end

  def destroy
  end

  def sort
    @study_set = StudySet.find_by_id(params[:id])
    if params[:sort] == "Alphabetical"
      @flash_cards = @study_set.flash_cards.sort_by {|fs| fs.term }
    else
      @flash_cards = @study_set.flash_cards
    end
    render :show
  end

  private

  def study_set_params
    params.require(:study_set).permit(:title, :description, :owner_id, :flash_cards_attributes => [:term, :definition, :_destroy, :id])
  end
end
