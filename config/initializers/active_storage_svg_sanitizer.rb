# frozen_string_literal: true

require "active_storage_svg_sanitizer/svg_sanitizer"

# ActiveStorage::Engine.config.active_storage.content_types_to_serve_as_binary.delete "image/svg+xml"

Rails.application.config.to_prepare do
  ActiveStorage::Blob.send :include, ActiveStorageSvgSanitizer::SvgSanitizer
end
