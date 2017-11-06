# kemal-cache-basic

Add basic caching feature to Kemal

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  kemal-cache-basic:
    github: valenciaj/kemal-cache-basic
```

## Usage

```crystal
require "kemal-cache-basic"
```

You must set "cache" key in context request object to true to enable cache, and the next request fly with Kemal. Be careful with non GET requests.

## Contributing

1. Fork it ( https://github.com/valenciaj/kemal-cache-basic/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [valenciaj](https://github.com/valenciaj) Javier Valencia - creator, maintainer
