# RailsGirls

This project is the starting point for my RailGirls workshop on Helpers,
Concerns, and Decorators.

## Assignments

### Create a helper

Currently, the posts and comments have very ugly looking meta
information. It looks something like this now:

> On Sat, 25 Oct 2014 19:55:42 +0000, by me@myco.com

We need to spruce that up a bit. For that we are going to use
`jQuery.timeago`. Head over to [their website](http://timeago.yarp.com/)
and add the [javascript file](http://timeago.yarp.com/jquery.timeago.js)
to your project.

After we're done it should look like this:

> By me@myco.com, 2 days ago.

#### Add the javascript

Download the [file](http://timeago.yarp.com/jquery.timeago.js) and put
it in `vendor/assets/javascripts/jquery.timeago.js`. Then add the
following line to your `app/assets/javascripts/application.js`

```javascript
//= require 'jquery.timeago'
```

#### Implement the helper

Check out the docs to see how we should format our HTML to enable it for
`jQuery.timeago`. It should be something like this:

```html
<abbr class="timeago" title="2014-10-25T09:24:17Z">October 25, 2014</abbr>
```

We want to have a helper method called `timeago` that we can call like
so:

```ruby
timeago(@post.created_at)

# or

timeago(@comment.created_at)
```

That helper method should take care of the entire HTML markup for us.


#### Enable the javascript

In order to enable the `jQuery.timeago` on these HTML snippets, we need
to call it on every page. Do do so, we will use a tiny CoffeeScript
snippet.

```coffeescript
# app/assets/javascripts/timeago.js.coffee
$ ->
  $("abbr.timeago").timeago()
```

That's it!

### Create a Decorator

As you can see in `app/views/posts/show.html.erb` and
`app/views/posts/index.html.erb`, we have to call `.html_safe` on the
content of a blog post, in order to have all the HTML markup rendered,
rather than the HTML being rendered as text. We are bound to forget that
at some point, so we should decorate it, to make sure that all decorated
posts have their content rendered as `html_safe`.

Start with removing the `.html_safe` calls from the following files:

```
app/views/comments/_comment.html.erb
app/views/posts/_post.html.erb
app/views/posts/show.html.erb
```

#### Add the Draper gem

We are going to use [Draper](https://github.com/drapergem/draper) to help us with the decoration process. Add
this to your Gemfile:

```ruby
gem 'draper'
```

And run `bundle install`

Then create the decorator:

```ruby
class PostDecorator < Draper::Decorator
  delegate_all

  def content
    object.content.html_safe
  end
end
```

Now, find the instances of `@post` and `@posts` in the `PostsController`
and make sure they are decorated. Consult the
[README](https://github.com/drapergem/draper) of Draper to get you
started on usage of the decorator gem.

> **Bonus** Note that we have removed `html_safe` from the comments view
> as well! Now go and make a decorator for your Comments too!

### Create a concern

When you open up the `Post` model, you will see it has a number of
methods that deal with publishing posts. Now, imagine we want to add
these methods to `Comment` as well. We could just copy over the methods
to the model file, but we could also extract this out into a concern, so
we do not need to copy this, and we can just include it in both the
`Post` and the `Comment` models!

#### Create the concern

```ruby
# app/models/concerns/shared/publishable.rb

module Shared::Publishable
  extend ActiveSupport::Concern

  included do
    # Move the methods from the Post model here!
  end
end
```

Now include it in the Post model

```
# app/models/post.rb

class Post < ActiveRecord::Base
  include Shared::Publishable

  # ...
end
```

And in the Comment model as well

```
# app/models/comment.rb

class Comment < ActiveRecord::Base
  include Shared::Publishable

  # ...
end
```

Now boot up a Rails console and check on some comments' published
status, e.g.:

```
$ spring rails console
$> Comment.last.published?
```

That should work for both Comment and Post models!
