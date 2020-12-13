require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  test "should return contact email" do
    mail = ContactMailer.contact_email("philmitchell@mail.com", "Phil", "Mitchell", "Hi, when is the deadline")
    assert_equal ["info@ModuleSelector.com"], mail.to
    assert_equal ["info@ModuleSelector.com"], mail.from
  end
end
