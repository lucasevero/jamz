class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
    authorize @group
  end

  def create

  end
end
