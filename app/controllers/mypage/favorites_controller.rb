class Mypage::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def index destroy
  end
end
