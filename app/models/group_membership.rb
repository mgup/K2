# Модель представляющая студентов, включенных в учебные группы или подгруппы.
class GroupMembership < ActiveRecord::Base
  groupify :group_membership
end
