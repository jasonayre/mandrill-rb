# Mandrill-rb

Stealing this from https://bitbucket.org/mailchimp/mandrill-api-ruby/ as of version 1.0.52, for multiple reasons.

1) its on bitbucket
2) it was broken in my application due mainly to some oddities caused by wonky file/class declaration (or lack thereof in the gem), i.e. specifically:

``` ruby
module API
  class WhateverController

  end
end
```

Was making ::Mandrill::API or Mandrill::API or whatever, point to the API module, then break. Short version, didnt have ton of time to dig into it, but when I cloned source of mandrill gem off bitbucket I wasn't suprised it was breaking.

So I broke everything into separate files, added some scope resolution operators for safety and speed, and thats the extent of it so far.

I may end up refactoring to make it more resourceful, which is why I elected to release it under a separate gem name, that and the majority of devs will appreciate it being on github, and being able to dig through the source on GH, and it works for now.

```ruby
require 'mandrill'
```

or using bundler:

```ruby
gem 'mandrill-rb'
```