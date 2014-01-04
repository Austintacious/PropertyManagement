require 'spec_helper'

feature 'User adds a building' do

  scenario 'specifying valid information' do
    visit root_path
    click_link "Add a Building"
    fill_in "Street Address", with: "1234 Blah Street"
    fill_in "City", with: "Nowhere"
    select "MA", from: "State"
    fill_in "Zipcode", with: 02151
    click_button "Create Building"
    expect(page).to have_content("Building created successfully!") 
  end

  scenario 'required information not specified' do
    visit root_path
    click_link "Add a building"
    click_button "Create Building"
    expect(page).to have_content("can't be blank")
  end

end