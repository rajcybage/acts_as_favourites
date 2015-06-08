class Favorite < ActiveRecord::Base
  belongs_to :favoriter
  belongs_to :favorable
end