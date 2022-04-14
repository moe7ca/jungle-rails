require 'rails_helper'
RSpec.describe User, type: :model do
    subject {described_class.new(:firstname => 'Raj', :lastname => 'Patel', :email => 'raj@gmail.com', :password => '123456' ,:password_confirmation => '123456')}  
    describe 'Validations' do
      # validation examples here
      it 'all fild is saved then empty filed' do
        subject.valid?
        expect(subject.errors).to be_empty
    end  
     it 'please enter first name is not empty' do
        subject.firstname = nil
        subject.valid?
      expect(subject.errors).not_to be_empty 
     end
     it 'please enter last name is not empty' do
        subject.lastname = nil
        subject.valid?
      expect(subject.errors).not_to be_empty 
     end
     it 'please enter email is not empty' do
        subject.email = nil
        subject.valid?
      expect(subject.errors).not_to be_empty 
     end
     it 'please enter password is not empty' do
        subject.password = nil
        subject.valid?
      expect(subject.errors).not_to be_empty 
     end
     it 'please enter confirmation password is not empty' do
        subject.password_confirmation = nil
        subject.valid?
      expect(subject.errors).not_to be_empty 
     end
     it 'please password and confirmation password are same' do
        subject.password_confirmation = '789012'
        subject.valid?
      expect(subject.errors).not_to be_empty 
     end
     it 'please your password legth at least 6 charecter' do
        subject.password = '123'
        subject.password_confirmation = '123'
        subject.valid?
        expect(subject.errors).not_to be_empty 
       end
     it 'please email is not same for differnt account' do
       User.create(:firstname => 'raj', :lastname => 'patel', :email => 'raj@gmail.com', :password => '123456', :password_confirmation => '123456')
       subject.valid?
       expect(subject.errors).not_to be_empty 
      end
    end
  
    describe '.authenticate_with_credentials' do
      # examples for this class method here
      fit 'user successful login enter valid email and password' do
        subject.save
        expected_user = User.authenticate_with_credentials(subject.email,subject.password)
        expect(subject).to eql(expected_user)
      end
      it 'user unsuccessful login enter invalid email and password' do
        subject.save
        user = User.authenticate_with_credentials('raj@gamil.com', '123478')
        expect(user).to be == nil
      end
      
      it 'user successful login enter valid capital email and password' do  
       subject.save
        expected_user = User.authenticate_with_credentials(subject.email.upcase,subject.password)
        expect(subject).to eql(expected_user)
      end
      it 'user successful login enter valid spaces before and/or after email and password' do  
        subject.save
         expected_user = User.authenticate_with_credentials(' Raj@gmail.com ',subject.password)
         expect(subject).to eql(expected_user)
       end
    end
  
  end