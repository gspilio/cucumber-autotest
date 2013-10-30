require "spec_helper"

describe "autotest/discover.rb" do
  
  context "with features dir" do
    before :each do
      File.stub(:directory?).with("features") {true}
    end

    context "with AUTOFEATURE true" do
      before :all do
        ENV['AUTOFEATURE'] = "true"
      end

      it 'adds "cucumber" to the list of discoveries' do
        expect(Autotest).to receive(:add_discovery)
        load File.expand_path("../../../lib/autotest/discover.rb",__FILE__)
      end
    end
  
    context "with AUTOFEATURE false" do
      before :all do
        ENV['AUTOFEATURE'] = "false"
      end

      it 'does not add "cucumber" to the list of discoveries' do
        expect(Autotest).not_to receive(:add_discovery)
        load File.expand_path("../../../lib/autotest/discover.rb",__FILE__)
      end
    end
  
    context "with AUTOFEATURE undefined" do
      before :all do
        @orig_stdout = $stdout
        $stdout = File.open('/dev/null', 'w')
        ENV.delete('AUTOFEATURE')
      end

      after :all do
        $stdout = @orig_stdout
      end
  
      it 'does not add "cucumber" to the list of discoveries' do
        expect(Autotest).not_to receive(:add_discovery)
        load File.expand_path("../../../lib/autotest/discover.rb",__FILE__)
      end
  
      it 'puts help message' do
        expect($stdout).to receive(:puts).with(
          %q{Not running features.
To run features in autotest, set AUTOFEATURE=true.
To remove this message, set AUTOFEATURE=false.}
        )
        load File.expand_path("../../../lib/autotest/discover.rb",__FILE__)
      end  
    end
  end
end

