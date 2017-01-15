class MatchesController < ApplicationController
  before_action :user_logged_in

  def index
    @matches = cur_user.matches
  end

  def new
    @match = Match.new
    @match.heros.build
    #@match.heros = @match.heros.new
  end

  def create
    @match = cur_user.matches.create(matches_params)
    @match.heros.build
    if @match.save
      flash[:success] = "Match Added!"
      redirect_to 'new'
    else
      flash[:danger] = "Match save failed"
      redirect_to 'new'
    end
  end

  def update
  end

  def destroy
  end

  def matches_params
    params.require(:match).permit(:rank, :video_link, :notes, :map, :group_size, heros_attributes: [:id, :hero])
  end

end
