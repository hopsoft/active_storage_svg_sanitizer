# frozen_string_literal: true

module ActiveStorageSvgSanitizer
  module SvgSanitizer
    extend ActiveSupport::Concern

    included do
      after_create_commit :sanitize_svg, if: :svg?
    end

    def svg?
      filename.extension == "svg"
    end

    def sanitize_svg
      ActiveStorageSvgSanitizer::SanitizeSvgJob.set(wait: 10.seconds).perform_later self
    end
  end
end
