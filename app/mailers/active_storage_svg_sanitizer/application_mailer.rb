# frozen_string_literal: true

module ActiveStorageSvgSanitizer
  class ApplicationMailer < ActionMailer::Base
    default from: "from@example.com"
    layout "mailer"
  end
end
