class ChaptersController < ApplicationController
  def index
    @novel = Novel.find(params[:novel_id])
    @chapters = @novel.chapters

    @novel_title = @novel.title
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

  def show
    @novel = Novel.find(params[:novel_id])
    @chapter = Chapter.find(params[:id])

    @chapter_title = @chapter.title
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :main_text)
  end
end