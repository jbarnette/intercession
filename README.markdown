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

## License and Author

Copyright 2009 John Barnette (jbarnette@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
