class StudySetsController < ApplicationController

  def create

  end

  def update
  end

  def index
    @study_sets = StudySet.all
  end

  def new
    @flash_card_count =  params[:flash_card_count].to_i || 5
    @study_set = current_user.study_sets.build
    @flash_cards = @flash_card_count.times { @study_set.flash_cards.build }
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
end
