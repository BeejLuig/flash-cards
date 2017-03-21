class FlashCardsController < ApplicationController
  def show
    @flash_card = FlashCard.find(params[:id])
    render json: @flash_card
  end
end
