class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(name_and_favorite_game_params)
      flash[:notice] = "Information successfully updated for #{@user.name || @user.id }"
      redirect_to(users_path)
    else
      flash[:error] = "Somethin went wrong with updating user #{@user.id}'s details"
      render('edit')
    end
  end

  private

  def name_and_favorite_game_params
      params.require(:user).permit(:name, :favorite_game)
  end

end
