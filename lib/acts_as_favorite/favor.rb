module ActsAsFavorite
  module Favor

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_favorable
        has_many :favorites, as: :favorable, dependent: :destroy
        include ActsAsFavorite::Favor::InstanceMethods
      end

      def favorable?
        true
      end
    end


    module InstanceMethods
    #instance methods
      def favorites_count
        favorites.count
      end

      def favorite_by?(favoriter)
        favorites.find_by(favoriter_id: favoriter.id, favoriter_type: favoriter.class.base_class.name).present?
      end  

      def favorite_by(favoriter)
        favorites.create(favoriter_id: favoriter.id, favoriter_type: favoriter.class.base_class.name)
      end

      def unfavorite_by(favoriter)
        records = favorites.find_by(favoriter_id: favoriter.id, favoriter_type: favoriter.class.base_class.name)
        records.try(:destroy)
      end

      def update_favorite(id, favoriter)
        records = favorites.find(id)
        records.update_attributes(favoriter_id: favoriter.id, favoriter_type: favoriter.class.base_class.name)
      end
    end   
  end
end  