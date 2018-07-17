# frozen_string_literal: true

require_relative '../spec_helper'

describe 'The Tile App' do
  
 it 'should allow users to login to an unconfirmed account', disabled: true do
  $helpers.login_with 'vibha.ramesh+dev10@thetileapp.com', 'raghupannu'
  $helpers.logout

 end


it 'should allow users to login to a confirmed account', disabled: true do
  $helpers.login_with 'vibha.ramesh@thetileapp.com', 'raghupannu'
  $helpers.logout

 end

it 'should allow users to login with bluetooth not set', disabled: true do
  $helpers.login_without_permissions 'vibha.ramesh@thetileapp.com', 'raghupannu' , '1' ,'Always Allow'
  $helpers.logout
end

it 'should allow users to login with location not set', disabled: true do

  $helpers.login_without_permissions 'vibha.ramesh@thetileapp.com', 'raghupannu' , '1' , 'Allow' 
  $helpers.logout

end


it 'should not allow users to login with invalid credentials', disabled: true do
    	$helpers.login_with_wrong_details 'vibha.ramesh@thetileapp.com', 'raghupannu123'
    	#skip('pending')
    	
end


it 'should not allow users to login with facebook', disabled: false do
      $helpers.login_with_fb  
      #skip('pending')
      
end


it 'should let users reset the password', disabled: true do
    	$helpers.forgot_password 'vibha15@gmail.com'	
    	#skip('pending')
    	
end


 
 end

	


