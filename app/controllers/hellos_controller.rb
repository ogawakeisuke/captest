# -*- coding: utf-8 -*-
class HellosController < ApplicationController


  def index
    @diaries = Diary.indexy

    respond_to do |format|
      format.html
      format.json { render json: @diaries }
    end
  end

  def static_matter
    @matters = Diary.matter
    render  "hellos/matter"
  end

  def customer_list
    @customers = Diary.customy
    render  "hellos/customer"
  end


end
