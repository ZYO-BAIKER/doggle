class DogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_dog, only: [:edit, :update, :destroy]
  before_action :return, only: [:edit, :update]

  def index
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.valid?
      @dog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @dog.user_id
      @dog.destroy
      redirect_to root_path
    else
      redirect_to dog_path
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:image, :name, :description, :type_id, :dog_sex_id).merge(user_id: current_user.id)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def return
    redirect_to root_path unless user_signed_in? && current_user.id == @dog.user_id
  end

end
