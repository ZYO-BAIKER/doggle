class DogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :return, only: [:edit]
  before_action :search_dog, only: [:index, :search]

  def index
    set_dog_column
    set_user_column
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

  def show
    @dogs = Dog.where(id: params[:id])
    @comment = Comment.new
    @comments = @dog.comments.includes(:user).order(id: 'DESC')
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

  def search
    @results = @p.result.includes(:user)  # 検索条件にマッチした商品の情報を取得
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

  def search_dog
    @p = Dog.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_dog_column
    @dog_type_id = Type.where.not(id: 1)
    @dog_sex_id = DogSex.where.not(id: 1) 
  end

  def set_user_column
    @user_sex_id = Sex.where.not(id: 1) 
    @user_age_id = Age.where.not(id: 1)
    @user_prefecture_id = Prefecture.where.not(id: 1)
  end
end
