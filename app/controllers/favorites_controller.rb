class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
    #コードの説明
    #current_user.favorites.createは、current_userに結び付いているfavoriteを作成しているという意味
    #この書き方にすることでfavoriteテーブルのuser_idには自動的にログインしている人のcurrent_user.idが入る
    #(recipe_id: params[:recipe_id])この書き方で、いいねした記事のIDが必要になるからいいねした記事のIDを取得する
    #params[:recipe_id]を取ってきてrecipe_id:に格納している

    redirect_back(fallback_location: root_path)
    #コードの説明
    #これは、いいねしたときに前の画面に戻る。
    #一覧画面でいいねをしたら、一覧画面に戻って、詳細画面でいいねをしたら、詳細画面に戻るということをこのコードで行なっている。
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    #currnet_userに結びついているfacoritesをfind_byで持ってきてrecipe_idが上のコードで取ってきたrecipe.idを入れている
    #current_userには、user_idが入っていてrecipe_idには上のコードで取ってきた@recipeが入っている

    @favorite.destroy #上記で取ってきたものを削除している。
    redirect_back(fallback_location: root_path)
    #万が一前のURLが見つからなかったらroot_pathに遷移させる
    #これがなかったらエラーになるかもしれないから
  end
end
