require 'spec_helper'

describe Cheet do
  
  context 'posting a Cheet' do

    it 'when there are no cheets, the chitterPipe has "No Cheets Yet"' do
      visit('/cheets')
      expect(find('#chitterPipe')).to have_content("No Cheets Yet")
    end

    it 'when there is 1 cheet, it is displayed in the chitterPipe' do
      user = create(:user)
      create(:cheet, user: user)
      visit('/cheets')
      expect(find('#chitterPipe')).to have_content("This is a message")
    end
   
  end

end