class User < ActiveRecord::Base
  acts_as_favoriter
end

class Post < ActiveRecord::Base
  acts_as_favorable
end

class Favorite < ActiveRecord::Base
  belongs_to :favoriter, polymorphic: true
  belongs_to :favorable, polymorphic: true
end