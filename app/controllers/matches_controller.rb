class MatchesController < ApplicationController
  before_action :user_logged_in

  def index
    @matches = cur_user.matches
  end

  def new
    @match = Match.new
  end

  def create
    @match = cur_user.matches.build(matches_params)
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

  #dont forget to add heroes
  def matches_params
    params.require(:match).permit(:rank, :video_link, :notes, :map, :group_size)
  end

end
