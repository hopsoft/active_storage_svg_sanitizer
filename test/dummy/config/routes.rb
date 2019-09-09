# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActiveStorageSvgSanitizer::Engine => "/active_storage_svg_sanitizer"
end
