class WelcomeController < ApplicationController
  def index
    flash[:notice]="欢迎来到宠物之家！"
  end
end
