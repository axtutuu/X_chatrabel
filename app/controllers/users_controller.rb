class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    current_user.update(update_params)
    redirect_to user_path(id: current_user.id)
  end

  def cities_select
    if request.xhr?
      render partial: 'shared/cities', locals: {prefecture_id: params[:prefecture_id]}
    end
  end

  private
  def update_params
    params.require(:user).permit(:family_name, :first_name, :prefecture_id, :city_id, :avatar)
  end

  def search_params
    params.permit(:prefecture_id)
  end
end
