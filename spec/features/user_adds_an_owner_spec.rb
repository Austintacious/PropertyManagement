require 'spec_helper'

feature 'User adds an owner' do

  scenario 'specifying valid information' do
    visit root_path
    click_link "Add an Owner"
    fill_in "First Name", with: "Mister"
    fill_in "Last Name", with: "Winslow"
    fill_in "Email", with: "blah@blah.com"
    click_button "Create Owner"
    expect(page).to have_content("Mister Winslow") 
  end

  scenario 'required information not specified' do
    visit root_path
    click_link "Add an Owner"
    click_button "Create Owner"
    expect(page).to have_content("can't be blank")
  end

end