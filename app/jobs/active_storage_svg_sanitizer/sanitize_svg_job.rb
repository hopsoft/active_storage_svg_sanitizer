# frozen_string_literal: true

module ActiveStorageSvgSanitizer
  class SanitizeSvgJob < ApplicationJob
    def perform(blob)
      return unless blob.svg?
      return if blob.metadata[:sanitized]

      sanitized = sanitize(blob.download)
      Tempfile.open([blob.filename.base, blob.filename.extension]) do |file|
        file.print sanitized
        file.rewind
        blob.upload file
      end

      blob.metadata[:sanitized] = true
      blob.save
    end

    private

    def sanitize(unsafe_xml)
      unsafe_xml = unsafe_xml.to_s
      unsafe_xml.force_encoding "UTF-8"
      return Loofah.xml_document(unsafe_xml).scrub!(scrubber).to_s if document?(unsafe_xml)
      Loofah.xml_fragment(unsafe_xml).scrub!(scrubber).to_s
    end

    def scrubber
      Loofah::Scrubber.new do |node|
        node.remove if node.name == "script"
      end
    end

    def document?(unsafe)
      unsafe.include?("<?xml") || unsafe.include?("<!DOCTYPE")
    end
  end
end
