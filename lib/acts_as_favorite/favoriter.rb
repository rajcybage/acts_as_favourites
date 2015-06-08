module ActsAsFavorite
  module Favoriter

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_favoriter
        has_many :favorites, as: :favoriter, dependent: :destroy
        include ActsAsFavorite::Favoriter::InstanceMethods
      end

      def favorable?
        true
      end
    end
    
    module InstanceMethods
      #instance methods
      def favorite?(favorable)
        favorites.find_by(favorable_id: favorable.id, favorable_type: favorable.class.base_class.name).present?
      end  

      def favorite(favorable)
        unless self.favorite?(favorable)
          favorites.create(favorable_id: favorable.id, favorable_type: favorable.class.base_class.name)
        end
      end

      def unfavorite(favorable)
        records = favorites.find_by(favorable_id: favorable.id, favorable_type: favorable.class.base_class.name)
        records.try(:destroy)
      end

      def update_favorite(favorable)
        records = favorites.find(favorable.id)
        records.update_attributes(favorable_id: favorable.id, favorable_type: favorable.class.base_class.name)
      end
    end   
  end
end  