class ApplicationMailer < ActionMailer::Base
  default to: "info@ModuleSelector.com", from: "info@ModuleSelector.com"
  layout 'mailer'
end
