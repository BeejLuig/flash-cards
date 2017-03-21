class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find_by_id(params[:id])
    @flash_cards = @user.flash_cards.select { |fc| fc.study_set.owner == @user}
    @study_sets = @user.study_sets.select { |set| set.owner == @user }
    @studied = @user.study_sets.select {|set| set.owner != @user }
    @folders = @user.folders
  end
end
