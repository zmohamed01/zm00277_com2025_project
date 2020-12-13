require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
   test "should get home" do
     get root_url
     assert_response :success

     assert_select 'h5', 'Module Options Selector 2020'
     assert_select 'p', 'Take your education into your own hands and specially curate your module options to your strengths and future job aspirations!'
   end

   test "should get contact" do
     get contact_url
     assert_response :success

     assert_select 'h1', 'CONTACT US'
     assert_select 'label', 'Email address'
   end

  test "should post request contact but no email" do

   post request_contact_url

   assert_response :redirect
   assert_not_empty flash[:alert]
   assert_nil flash[:notice]
  end


  test "should post request contact" do

  post request_contact_url, params:
     {firstname: "Matthew", surname: "James", email: "matthew@mail.com",
   message: "hello"}

   assert_response :redirect
   assert_nil flash[:alert]
   assert_not_empty flash[:notice]
  end

   test "should post request contact but invalid email" do

     post request_contact_url, params:
         {firstname: "Matthew", surname: "James", email: "m",
          message: "hello"}

     assert_response :redirect
     assert_not_empty flash[:alert]
     assert_nil flash[:notice]
   end


end
