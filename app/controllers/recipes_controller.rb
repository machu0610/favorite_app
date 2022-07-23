class RecipesController < ApplicationController
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
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body)
  end
end
