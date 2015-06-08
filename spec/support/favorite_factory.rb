module FavoriteFactory
  def create_favorite(favoriter, favorable)
    Favorite.create(favorable_id: favorable.id, favorable_type: favorable.class.base_class.name, favoriter_id: favoriter.id, favoriter_type: favoriter.class.base_class.name)
  end
end