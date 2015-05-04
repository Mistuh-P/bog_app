class TagsController < ApplicationController

def index
  @tags = Tag.all
end


def new
  @tag = Tag.new()
end

def create
  @tag = Tag.create(tag_params)
  redirect_to tags_path #:tags

end

def edit
  @tag = Tag.find(params[:id])
end

def update
   @tag = Tag.update(params[:id], tag_params)
  redirect_to tags_path
end

def show
    @tag = Tag.find(params[:id])
    @creatures = @tag.creatures

  end

def destroy

   @tag = Tag.find(params[:id])


   if @tag.creatures.length == 1

    flash[:danger] = "Can't delete! There is #{ @tag.creatures.length } creature using this tag!"

   elsif @tag.creatures.length > 1

    flash[:danger] = "Can't delete! There are #{ @tag.creatures.length } creatures using this tag!"

   else

    @tag.destroy

  end



    redirect_to tags_path
end

private

def tag_params
    params.require(:tag).permit(:name)
  end

end