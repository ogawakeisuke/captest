# -*- coding: utf-8 -*-
class HellosController < ApplicationController
  def index
    render :text => "こんにちわ世界"
  end
end
