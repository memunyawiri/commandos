require 'tips_sanitiser'
describe Tips_Sanitiser do
  subject(:tips_sanitiser) { described_class.new }
  let!(:raw_tips_array) { [tip_a, tip_l, nil, nil, tip_t, nil, tip_a, tip_a]}
  let!(:clean_tips_array) { [tip_a, tip_l, tip_t]}
  let!(:tip_a) { '-a would give you hidden files as well' }
  let!(:tip_l) { '-l would give you more information about your files' }
  let!(:tip_t) { '-t gives you a list of files sorted by time modified :-)' }

  describe '#sanitise' do
    it 'removes all the nils from an array' do
      expect(tips_sanitiser.sanitise(raw_tips_array)).to eq(clean_tips_array)
    end

    it 'removes any duplicte elements' do
      expect(tips_sanitiser.sanitise(raw_tips_array)).to eq(clean_tips_array)
    end
  end


end
