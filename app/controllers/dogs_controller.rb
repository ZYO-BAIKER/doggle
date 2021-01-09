class DogsController < ApplicationController

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

  private

  def dog_params
    params.require(:dog).permit(:image, :name, :description, :type_id, :sex_id).merge(user_id: current_user.id)
  end

end
