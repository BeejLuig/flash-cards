class UsersController < ApplicationController

  def update
  end

  def show
    @study_sets = current_user.study_sets
  end

  def edit
  end

  def destroy
  end
end
