require 'ls'

describe Ls do
  subject(:ls) { described_class.new }
  let!(:tip_a) { "-a would give you hidden files as well" }
  let!(:tip_l) { "-l would give you more information about your files" }
  let!(:tip_la) { "Did you know, you can also run “ls -la” to get more information about your ALL your files!" }
  let!(:tip_lt) { "-lt gives you a list of files sorted by time modified :-)" }

  describe '#suggest_tips' do
    describe "Edge cases" do
      it "passes all of the tips if no of the flags are used" do
        expect(ls.suggest_tips("ls")).to eq([tip_a, tip_l, tip_la, tip_lt])
      end
    end

    describe 'Tip for "a" flag' do
      it 'can suggest using -a option when it is not used' do
        expect(ls.suggest_tips("ls -l").include?(tip_a)).to be true
      end

      it 'does not suggest using -a option when already used in an individual format' do
        expect(ls.suggest_tips("ls -l -a").include?(tip_a)).to be false
      end

      it 'does not suggest using -a option when already used in a combined format' do
        expect(ls.suggest_tips("ls -la").include?(tip_a)).to be false
      end
    end

    describe 'Tip for "l" flag' do
      it 'can suggest using -l option when it is not used' do
        expect(ls.suggest_tips("ls -a").include?(tip_l)).to be true
      end

      it 'does not suggest using -l option when already used in an individual format' do
        expect(ls.suggest_tips("ls -l -a").include?(tip_l)).to be false
      end

      it 'does not suggest using -a option when already used in a combined format' do
        expect(ls.suggest_tips("ls -la").include?(tip_l)).to be false
      end
    end

    describe 'Tip for la flag' do
      it 'can suggest using -la option when it is not used' do
        expect(ls.suggest_tips("ls").include?(tip_la)).to be true
      end

      it 'does not suggest using -la option when already used in a combined format' do
        expect(ls.suggest_tips("ls -la").include?(tip_la)).to be false
      end
    end

    describe 'Tip for "-lt" flag' do
      it 'can suggest using -lt option when it is not used' do
        expect(ls.suggest_tips("ls").include?(tip_lt)).to be true
      end

      it 'does not suggest using -lt option when already used' do
        expect(ls.suggest_tips("ls -lt").include?(tip_lt)).to be false
      end
    end

  end
end
