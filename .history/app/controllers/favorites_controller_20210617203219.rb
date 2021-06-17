class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # POST /books/:book_id/favorites
  # POST /favorites.json
  def create
    unless Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    #findは一つしか検索できないのでundifinded join出る
      @favorite = current_user.favorites.new(:book_id => params[:book_id])
      @favorite.save
      #redirect_to books_path
    end
  end


  # DELETE /books/:book_id/favorites/
  def destroy
    if Favorite.find_by(book_id: params[:book_id], user_id: current_user.id).exists?
      @favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
      @favorite.destroy
      #redirect_to books_path
    end
  end
end
