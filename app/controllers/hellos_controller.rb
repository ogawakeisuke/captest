# -*- coding: utf-8 -*-
class HellosController < ApplicationController

  def index
    @diaries = Diary.where(1)

    respond_to do |format|
      format.html
      format.json { render json: @diaries }
    end
  end

end
