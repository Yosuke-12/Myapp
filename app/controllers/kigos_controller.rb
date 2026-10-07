class KigosController < ApplicationController
  before_action :require_login, only: [ :new, :create ]
  before_action :set_kigo, only: %i[ destroy]

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

  def create
    @kigo = current_user.kigos.new(kigo_params)

    if @kigo.save
      redirect_to root_path, success: "季語の新規登録に成功しました"
    else
      flash.now[:danger] = "季語の登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @kigo.destroy!
    redirect_to user_path(current_user), notice: t("defaults.flash_message.deleted", item: "季語")
  end

  private
    # Only allow a list of trusted parameters through.
    def kigo_params
      params.require(:kigo).permit(:headword, :season, :meaning, :example)
    end

    def set_kigo
      @kigo = current_user.kigos.find(params[:id])
    end
end
