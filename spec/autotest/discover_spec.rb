require "spec_helper"

describe "autotest/discover.rb"
  
  it "adds a discovery" do
    expect(Autotest).to receive(:add_discovery)
    load File.expand_path("../../../lib/autotest/discover.rb",__FILE__)
  end

  context "with AUTOFEATURE true" do
    it 'adds "cucumber" to the list of discoveries' do
      expect(Autotest).to receive(:add_discovery)
      load File.expand_path("../../../lib/autotest/discover.rb",__FILE__)
    end
  end

  context "with AUTOFEATURE false" do
    it 'does not add "cucumber" to the list of discoveries' do
      expect(Autotest).to not_receive(:add_discovery)
      load File.expand_path("../../../lib/autotest/discover.rb",__FILE__)
    end
  end

  context "with AUTOFEATURE undefined" do
    before :all do
      ENV.delete('AUTOFEATURE')
    end

    it 'does not add "cucumber" to the list of discoveries' do
      expect(Autotest).to not_receive(:add_discovery)
      load File.expand_path("../../../lib/autotest/discover.rb",__FILE__)
    end

    it 'puts help message' do
      expect(IO).to receive(:puts).with(
        %q{Not running features.
           To run features in autotest, set AUTOFEATURE=true.
           To remove this message, set AUTOFEATURE=false.}
      )
      load File.expand_path("../../../lib/autotest/discover.rb",__FILE__)
    end  
  end
