class KigosController < ApplicationController
  def index
    @words = if params[:search].present? # サイドバーの一覧表示用
      Kigo.search_by_term(params[:search])
    else
      Kigo.none
    end

    @word = @words.first # 最初の一件を中央にデフォルト表示
  end

  def show
    @word = Kigo.find(params[:id])
  end

  def new
    @kigo = Kigo.new
  end
end
