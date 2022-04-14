require 'rails_helper'
RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They see products details" do
    
    # ACT

    visit root_path
    find_link("Details »", match: :first).click
    sleep 5
    puts page.html

    # DEBUG / VERIFY
    
    save_screenshot
    expect(page).to have_content 'Quantity'
  end

end