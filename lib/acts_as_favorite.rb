require "acts_as_favorite/version"
require "active_support"

module ActsAsFavorite
  require 'acts_as_favorite/favoriter.rb'
  require 'acts_as_favorite/favor.rb'
end

ActiveSupport.on_load(:active_record) do
  include ActsAsFavorite::Favoriter
  include ActsAsFavorite::Favor
end
