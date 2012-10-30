module PlayFutsal
  class Group < ActiveRecord::Base

    #### Relations ####

    has_many :group_stats
    has_many :teams, :through => :group_stats

    has_many :matches


    #### Accessors ####

    attr_accessible :name


    #### Scopes ####
    default_scope order('id ASC')
  end
end
