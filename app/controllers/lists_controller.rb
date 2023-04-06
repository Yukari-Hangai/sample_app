class ListsController < ApplicationController
  def new
    @list = List.new#Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
  end

  def create
    list = List.new(list_params)#1.&2 データを受け取り新規登録するためのインスタンス作成
    list.save#3 データをデータベースに保存するためのsaveメソッド実行
    redirect_to list_path(list.id)#詳細画面へリダイレクト
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  private#ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end