class VirtualCompGroupsController < ApplicationController
  before_action :set_virtual_comp_group, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @virtual_comp_groups = VirtualCompGroup.order(:name)
  end

  def show
  end

  def new
    @virtual_comp_group = VirtualCompGroup.new
  end

  def edit
  end

  def create
    @virtual_comp_group = VirtualCompGroup.new(virtual_comp_group_params)

    if @virtual_comp_group.save
      redirect_to @virtual_comp_group, notice: 'Virtual comp group was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @virtual_comp_group.update(virtual_comp_group_params)
      redirect_to @virtual_comp_group, notice: 'Virtual comp group was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @virtual_comp_group.destroy
    redirect_to virtual_comp_groups_url
  end

  private

  def set_virtual_comp_group
    @virtual_comp_group = VirtualCompGroup.find(params[:id])
  end

  def virtual_comp_group_params
    params.require(:virtual_comp_group).permit(:name, :display_on_start_page)
  end
end
