# -*- coding: utf-8 -*-
class HellosController < ApplicationController


  def index
    @diaries = Diary.visibility

    respond_to do |format|
      format.html
      format.json { render json: @diaries }
    end
  end

  def static_matter
    @matters = Diary.matter
    render  "hellos/matter"
  end

end
