class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :resipes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(recipe) #いいねの判定をするためのメソッド(自作メソッド)
    self.favorites.exists?(recipe_id: recipe.id)
    #コードの説明
    #selfにはcurrent_userが入る。
    #crrent_userに結びついているいいねの中で、recipe_idが今いいねをしようとしているレシピのID recipe.idが存在するかを調べている
  end
end
