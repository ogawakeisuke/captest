class Diary < ActiveRecord::Base
  attr_accessible :state, :tag_id, :text, :title, :visibility
end
