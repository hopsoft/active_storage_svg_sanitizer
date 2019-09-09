# ActiveStorageSvgSanitizer

A small library that sanitizes ActiveStorage SVG uploads by stripping any embedded `script` tags.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_storage_svg_sanitizer'
```

## Usage

Simply including this gem will ensure your svg uploads are sanitized.

_This libary uses ActiveJob to perform sanization tasks in the background._


### Rendering SVG Images

If you'd like to render ActiveSorage svg images in your application, add an initializer that unregisters `svg` as a binary file type.

```ruby
# config/initializers/active_storage.rb
ActiveStorage::Engine.config.active_storage.content_types_to_serve_as_binary.delete "image/svg+xml"
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
