class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates_uniquenss_of :recipe_id, scope: :user_id #この書き方でrecipe_idとuser_idの組みが一通りしかないことができる
end
