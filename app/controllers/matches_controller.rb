class MatchesController < ApplicationController

  def index
    @matches = cur_user.matches
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

end
