require 'spec_helper'

describe Owner do
  let(:blanks) {['', ' ', nil]}
  let(:invalid_emails) {['blah.com', '@blah.com', '@@.com', 'blah@.com', 'blah', '@@blah.com', 'com', '.com']}

  it {should have_valid(:first_name).when('Austin')}
  it {should_not have_valid(:first_name).when(*blanks)}

  it {should have_valid(:last_name).when('Winslow')}
  it {should_not have_valid(:last_name).when(*blanks)}

  it {should have_valid(:email).when('blah@blah.com')}
  it {should_not have_valid(:email).when(*blanks, *invalid_emails)}

  it {should have_many :buildings}
end
