class Diary < ActiveRecord::Base
  module Status
    MATTER = 2
    CUSTOMER = 3
  end
  module Visible
    PRIVATE = 0
    PUBLIC = 1
  end
  
  attr_accessible :state, :tag_id, :text, :title, :visibility

  scope :indexy, where(:visibility => 1 )
  scope :matter , where( :state => Status::MATTER )
  scope :customy , where( :state => Status::CUSTOMER )


end
