class Mypage::FavoritesController < ApplicationController
  layout "mypage"
  before_action :authenticate_user!

  def index destroy
  end
end
