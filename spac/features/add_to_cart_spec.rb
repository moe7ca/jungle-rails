require 'rails_helper'

RSpec.feature "Visitor add product from home page ", type: :feature, js: true do

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
  scenario "They product add to cart" do
 
    
    visit root_path
    puts page.html
    click_button("Add", match: :first).click
    sleep 5
   

    save_screenshot
    expect(page).to have_content 'My Cart (1)'
  end

end
