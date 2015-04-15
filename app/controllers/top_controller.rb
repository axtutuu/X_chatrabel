class TopController < ApplicationController
  def index
    @search = User.where.not(id: current_user.id).search(params[:q])
    @users = @search.result
  end

  def search
    @search = User.where.not(id: current_user.id).search(params[:q])
  end
end
