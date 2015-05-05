
FlickRaw.api_key=ENV["API_KEY"]
FlickRaw.shared_secret=ENV["API_SECRET"]


class CreaturesController < ApplicationController



  def index
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
    @tags = Tag.all
  end

  def create
    @creature = Creature.create(creature_params)

    # render :json => params

    tags = params[:creature][:tag_ids]
    tags.each do |t|
      @creature.tags << Tag.find(t) unless t.blank?
    end
    redirect_to @creature
  end

  def show
    @creature = Creature.find(params[:id])
    @tag = @creature.tags

    list = flickr.photos.search :text => @creature.name, :sort => "relevance"
    photos = list.map do |i|
       "https:/farm3.static.flickr.com/#{i["server"]}/" "#{i["id"]}_" "#{i["secret"]}_n.jpg"
    end
    @photo = photos.sample



  end

  def edit
    @creature = Creature.find(params[:id])
    @tags = Tag.all

  end

  def update
    @creature = Creature.find(params[:id])
    @creature.update(creature_params)

    @creature.tags.clear

    tags = params[:creature][:tag_ids]
    tags.each do |t|
      @creature.tags << Tag.find(t) unless t.blank?
    end


    redirect_to @creature


  end

  def destroy
    @creature = Creature.destroy(params[:id])
    redirect_to @creature
  end

  private

  def creature_params
    params.require(:creature).permit(:name,:desc)
  end

end