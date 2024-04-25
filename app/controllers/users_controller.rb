class UsersController < ApplicationController
  def show
    @user = User.find_by!(username: params.fetch(:username))
  end

  def tasks
    @user = User.find_by!(username: params.fetch(:username))
  end

  def completed
    @user = User.find_by!(username: params.fetch(:username))
  end

  def failed
    @user = User.find_by!(username: params.fetch(:username))
  end

  def pets
    @user = User.find_by!(username: params.fetch(:username))
  end
end
