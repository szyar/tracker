class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @assigned_issues = Issue.where(assigned_person: @user.username)
  end
end
