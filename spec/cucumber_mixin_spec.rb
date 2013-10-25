require 'spec_helper'
require 'autotest/cucumber_mixin'

describe "cucumber_mixin" do
  before :all do
    @super_test_class = Class.new do
      ALL_HOOKS = [:red]
      def get_to_green
      end
    end
    @test_mixin_class = Class.new(@super_test_class) do
      include Autotest::CucumberMixin
    end
  end

  context 'with an instance' do
    before :each do
      @obj = @test_mixin_class.new
    end   

    describe ":red_features and :green_features hooks" do
      before :each do
        @obj.stub(:wait_for_changes)
      end
      
      context 'with one failing scenario' do
        it "should have :red_features hook" do
          @obj.stub(:run_features)
          expect(@obj.class::ALL_HOOKS).to include(:red_features)
        end
  
        it "should use the :red_features hook when some scenario fails" do
          @obj.stub(:run_features)
          @obj.stub(:all_features_good).and_return(false,true)
          @obj.should_receive(:hook).with(:red_features).ordered
          @obj.should_receive(:hook).with(:green_features).ordered
          @obj.get_to_green
        end
      
        it "should count the failing scenarios" do
          @obj.stub(:hook)
          @obj.stub(:results=)
          @obj.stub(:tainted=)
          tempfile = double('tempfile')
          tempfile.stub(:path).and_return("/foo")
          tempfile.stub(:read).and_return("filename1:12:14:125\nfilename2:25:199")
          Tempfile.should_receive(:open).and_yield(tempfile).ordered
          #Tempfile.should_receive(:open).ordered
          @obj.run_features
          expect(@obj.failed_scenarios_count).to be(5)
        end
      end
        
      it "should have :green_features hook" do
        expect(@obj.class::ALL_HOOKS).to include(:green_features)
      end

      it "should use the :green_features hook when all scenarios succeed" do
        @obj.stub(:run_features)
        @obj.stub(:all_features_good).and_return(true)
        @obj.should_receive(:hook).with(:green_features)
        @obj.get_to_green
      end
      
      
    end
  end
end
