class FlashCardsController < ApplicationController
  def show
    @flash_card = FlashCard.find(params[:id])
    render json: @flash_card
  end

  def create
    binding.pry
  end

  private

  def flash_card_params
    params.require(:flash_card).permit(:term, :definition)
  end
end
