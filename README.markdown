# Intercession

Treat your sessions like models, not hashes. Intercession mixes a module into
the session on each request, allowing you to nicely encapsulate (and test!)
lots of user and session-specific behavior.

## Installation

Intercession works as a plugin or a gem. I've only used it as a plugin against
Rails 2.2, though, so YMMV. If you install it as a plugin, it'll create you a
stub session module in `app/models/transient/session.rb`.

As a plugin:

    $ script/plugin install git://github.com/jbarnette/intercession.git

As a Gem:

    $ [sudo] gem install jbarnette-intercession --source http://gems.github.com

## Example

Check out [this gist](http://gist.github.com/44506).

## Testing

Unit tests for your session model! Mix it in to a Hash and go to town:

    def setup
      @session = Hash.new
      @session.extend Transient::Session
    end
    
    test "getting user will find user from user_id key if available" do
      assert_nil @session.user
      @session[:user_id] = users(:default).id
      assert_equal users(:default), @session.user
    end
