class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index] #index以外ログインユーザ出ないとアクセスできない
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id #ログインユーザーのIDを@recipeのuser_id(カラム)に代入
    if @recipe.save #もし保存されたら
      redirect_to recipe_path(@recipe),notice: '投稿に成功しました。' #リダイレクトで投稿したレシピの詳細画面へ遷移する
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.user_id != current_user.id #編集する時、user_idとログインユーザーが等しくない(!=は等しくない)
      redirect_to recipes_path, alert: '不正なアクセスです。' #レシピの一覧画面に遷移
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "更新に成功しました。" #レシピの詳細画面に遷移
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path #レシピの一覧画面に遷移

    #@がついていないのはローカル変数だから
    #destroyアクションはビューには渡さないからつけていない
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body)
  end
end
