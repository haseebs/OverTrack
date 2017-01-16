class MatchesController < ApplicationController
  before_action :user_logged_in

  def index
    @matches = cur_user.matches

    respond_to do |format|
      format.html
      format.csv { send_data @matches.to_csv }
    end
  end

  def new
    @match = Match.new
    @match.heros.build
    #@match.heros = @match.heros.new
  end

  def create
    @match = cur_user.matches.create(wld: params[:match][:wld], rank: params[:match][:rank],
                                     map: params[:match][:map], group_size: params[:match][:group_size],
                                     video_link: params[:match][:video_link], notes: params[:match][:notes])
    #@match.heros.build
    if @match.save
      flash[:success] = "Match Added!"
      hero = @match.heros.build(hero: params[:match][:heros])
      hero.save
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
    # add wld
    params.require(:match).permit(:wld, :rank, :video_link, :notes, :map, :group_size, heros_attributes: [:id, :hero, :match_id])
  end

end
