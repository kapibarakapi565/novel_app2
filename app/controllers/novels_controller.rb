class NovelsController < ApplicationController

  def index
    @novels = Novel.includes(:chapters).all
  end

  def new
    @novel = Novel.new
  end

  def create
    @novel = Novel.create(novel_params)
    if @novel.save
      redirect_to new_novel_chapter_path(@novel)
    else
      render :new
    end
  end

  def edit
    @novel = Novel.find(params[:id]) 
  end

  def update
    novel = Novel.find(params[:id])
    novel.update(novel_params)
    redirect_to root_path
  end

  def destroy
    novel = Novel.find(params[:id])
    novel.destroy
    redirect_to root_path
  end

  private
  def novel_params
    params.require(:novel).permit(:title)
  end
  
end
