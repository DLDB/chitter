require 'spec_helper'

describe Chit do
  
  context 'posting a Chit' do

    it 'when there are no chits, the chitterPipe has "No Chits Yet"' do
      visit('/chits')
      expect(find('#chitterPipe')).to have_content("No Chits Yet")
    end

    specify 'a new chit is created with the current time' do

    end

  end

  context 'displaying the Chits' do
    before do
      user = create(:user)
      create(:chit, user: user, created_at: '2014-06-07 17:46:51')
    end

    it 'when there is a chit, it is displayed in the chitterPipe' do
      visit('/chits')
      expect(find('#chitterPipe')).to have_content("This is a message")
    end
   
  end

end