class UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
  @nickname = @user.nickname
  @recipes = @user.recipes
 end
end
