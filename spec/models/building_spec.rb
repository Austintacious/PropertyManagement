require 'spec_helper'

describe Building do
  let(:blanks) {['', nil]}

  it {should have_valid(:street_address).when("1234 Fake Street", "1 Real Street")}
  it {should_not have_valid(:street_address).when(1, -11, '-11 Fake St.', 'Fake St.', 'St.', *blanks)}

  it {should have_valid(:city).when("City")}
  it {should_not have_valid(:city).when(*blanks, -1, 1, "12abc34", "ab123cd")}

  it {should have_valid(:state).when("MA", "LA")}
  it {should_not have_valid(:state).when("Louisiana", "Massachusetts", *blanks)}

  it {should have_valid(:zipcode).when("02151")}
  it {should_not have_valid(:zipcode).when(*blanks, "12abc34", "ab123cd", "12cd3", "ab12c")}

  it {should belong_to(:owner)}
end
