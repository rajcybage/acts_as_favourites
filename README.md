Add favorite fuctionalities to any Active Record models through polymorphic association. 


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'acts_as_favorite'
```

And then execute:

    $ bundle

Run generator:

    $ rails generate favorable

And don't forget to migrate your database

    $ rake db:migrate

## Usage

### Favorable models

Add `acts_as_favorable` to any models, and its instances can be favorite by other models.

```ruby
class Post < ActiveRecord::Base
  acts_as_favorable
end
```

### Favoriter models

Add `acts_as_favoriter` to any models, and it can favorite instances of other models.

```ruby
class User < ActiveRecord::Base
  acts_as_favoriter
end
```

It is not necessary to use both `acts_as_favorable` and `acts_as_favoriter` . You can use one to execute.

### API

```ruby
# Count the number of favorites of @post
@post.favorites_count

# Check if @post is favorited by @user
@post.favorite_by?(@user)

# Create a new favorite record for @user, and @post
@post.favorite_by(@user)

# Destroy the favorite record
@post.unfavorite_by(@user)

#Update
@post.update_favorite(@user)
```



```ruby
# Create a new favorite record for @user, and @post
@user.favorite(@post)

# Destroy the favorite record
@user.unfavorite(@post)

# Check if @user favorite the @post
@user.favorite?(@post)
```

## Contributing

Issues and pull reqeusts are welcomed.