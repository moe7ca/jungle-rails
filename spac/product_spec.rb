require 'rails_helper'
RSpec.describe Product, type: :model do
    let(:category) {Category.new(:name => 'Electronic')}
    subject {described_class.new(:name => 'Speeding fail', :quantity => 12, :price_cents => 100, :category => category)}  
  
    describe 'Validations' do
      # validation tests/examples here

      it 'please enter valid data then field empty' do
        subject.valid?
        expect(subject.errors).to be_empty
        assc = described_class.reflect_on_association(:category)
        expect(assc.macro).to eq :belongs_to
      end
      it 'please enter name is not empty' do
        subject.name = nil
      subject.valid?
      expect(subject.errors).not_to be_empty    
     end
     it 'please enter Quantity is not empty' do
        subject.quantity = nil
      subject.valid?
      expect(subject.errors).not_to be_empty    
     end
     it 'please enter Priceis not empty' do
        subject.price_cents = nil
      subject.valid?
      expect(subject.errors).not_to be_empty    
     end
     it 'please enter Category not empty' do
        subject.category = nil
      subject.valid?
      expect(subject.errors).not_to be_empty    
     end
    end
  end