class Diary < ActiveRecord::Base
  attr_accessible :state, :tag_id, :text, :title, :visibility

  scope :visibility, where(:visibility => 1 )

  module Visible
    PRIVATE = 0
    PUBLIC = 1
  end
end
