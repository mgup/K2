class Hr::Position < ActiveRecord::Base
  belongs_to :department
  belongs_to :qualification, class_name: 'Hr::Qualification'
  belongs_to :user
end
