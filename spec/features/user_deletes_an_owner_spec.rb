require 'spec_helper'

feature 'User deletes an owner' do

  scenario 'deletes the owner and all associated primary keys' do
    owner = FactoryGirl.create(:owner)
    building = FactoryGirl.create(:building)
    building.owner_id = owner.id
    visit root_path
    expect(page).to have_content(building.zipcode)
    click_link "View Owners"
    click_link "Delete #{owner.id}"
    click_link "Back"
    expect(page).to_not have_content(building.owner_id)
    expect(page).to have_content(building.zipcode)
  end

end