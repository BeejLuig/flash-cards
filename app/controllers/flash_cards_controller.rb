class FlashCardsController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def show
    @flash_card = FlashCard.find(params[:id])
    render json: @flash_card
  end

  def create
    if user_verified?
      @study_set = StudySet.find_by_id(params[:study_set_id])

      if @study_set.flash_cards.create(flash_card_params)
        @flash_card = @study_set.flash_cards.last
        render json: @flash_card
      else
        render json: { error: "There was an error saving the new flash card" }
      end
    else
      whoops
    end
  end

  private

  def flash_card_params
    params.require(:flash_card).permit(:term, :definition)
  end
end
