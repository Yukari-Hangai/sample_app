class ListsController < ApplicationController
  def new
    @list = List.new#Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
  end

  def create
    list = List.new(list_params)#1.&2 データを受け取り新規登録するためのインスタンス作成
    list.save#3 データをデータベースに保存するためのsaveメソッド実行
    redirect_to'/top'#4 トップ画面へリダイレクト
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end

  private#ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end