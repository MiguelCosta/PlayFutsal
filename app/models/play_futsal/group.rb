module PlayFutsal
  class Group < ActiveRecord::Base

    #### Relations ####

    has_many :group_stats
    has_many :teams, :through => :group_stats, :order => "position"

    has_many :matches


    #### Accessors ####

    attr_accessible :name


<<<<<<< HEAD
    #### Scopes ####
    default_scope order('id ASC')
=======
    def refresh_positons
        pos = 1
        # Há alguma forma de melhorar este método? fazer um map talvez...
        gamesStats = GroupStat.find_all_by_group_id(self.id, :order => "points DESC")
        gamesStats.each do |gameStat|
            gameStat.update_attribute(:position, pos)
            pos += 1
        end
    end

>>>>>>> d81633132ef3b129b96f950c6462735e40da0df6
  end
end
