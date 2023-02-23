class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path, notice: "bookmark was succesfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark = Bookmark.destroy
    redirect_to bookmarks_path, notice: "bookmark was deleted"
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
