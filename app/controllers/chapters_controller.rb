class ChaptersController < ApplicationController
  def index
    @novel = Novel.find(params[:novel_id])
    @chapters = Chapter.all
  end
  
  def new
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.build
  end

  def create
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.create(chapter_params)
    
    if @chapter.save
      redirect_to novel_chapters_path(@novel), notice: '賞が作成されました。'
    else
      flash.now[:alert] = '章の作成に失敗しました。'
      render :new
    end
  end

  def edit
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.find(params[:id])
  end

  def update
    chapter = Chapter.find(params[:id])
    chapter.update(chapter_params)
    redirect_to novel_chapters_path
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :main_text)
  end
end