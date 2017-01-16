class MatchesController < ApplicationController
  before_action :user_logged_in
  #handle letting only proper user edit and delete

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
    @match = cur_user.matches.create(rank: params[:match][:rank],
                                     map: params[:match][:map], group_size: params[:match][:group_size],
                                     video_link: params[:match][:video_link], notes: params[:match][:notes])
    #@match.heros.build
    if @match.save
      flash[:success] = "Match Added!"
      hero = @match.heros.build(hero: params[:match][:heros])
      if hero.save
        redirect_to :back# 'new'
      else
        @match.destroy
      end
    else
      flash[:danger] = "Match save failed"
      redirect_to 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @hero = Hero.find(@match.id)
    @hero.update_attributes(hero: params[:match][:hero])
    if @match.update_attributes(rank: params[:match][:rank],
                                map: params[:match][:map], group_size: params[:match][:group_size],
                                video_link: params[:match][:video_link], notes: params[:match][:notes])
      flash[:success] = "Update Successful"
      redirect_to 'index'
    else
      flash[:danger] = "Update failed"
      render 'edit'
    end
  end

  def destroy
    Match.destroy(params[:id])
  end

  def matches_params
    # add wld
    params.require(:match).permit(:wld, :rank, :video_link, :notes, :map, :group_size, heros_attributes: [:id, :hero, :match_id])
  end

end
