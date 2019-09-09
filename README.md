# ActiveStorageSvgSanitizer

A small library that sanitizes ActiveStorage SVG uploads by stripping any embedded `script` tags.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_storage_svg_sanitizer'
```

## Usage

This libary uses ActiveJob to perform sanization tasks in the background.

Simply including this gem will ensure your svg uploads are sanitized.

If you'd like to render uploaded svg images in your application, add an initializer that unregisters `svg` as a binary file type.

```ruby
ActiveStorage::Engine.config.active_storage.content_types_to_serve_as_binary.delete "image/svg+xml"
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
