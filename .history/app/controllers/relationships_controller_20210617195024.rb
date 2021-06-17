class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:user_id])
    followings = current_user.follow(user)
    redirect_to request.referer #遷移前URL
    #logger.debug followings.errors.inspect
    #rollback transactionとなっていたらsaveできてない
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end
end
