class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
    authorize @group
  end

  def show
    @group = Group.find(params[:id])
    authorize @group
  end

  def create
    @group = Group.new(group_params)
    @user = current_user
    @group.user = @user
    authorize @group
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
