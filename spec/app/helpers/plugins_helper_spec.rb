RSpec.describe "Sebastian::App::PluginsHelper" do
  pending "add some examples to (or delete) #{__FILE__}" do
    let(:helpers) { Class.new }
    before { helpers.extend Sebastian::App::PluginsHelper }
    subject { helpers }

    it "should return nil" do
      expect(subject.foo).to be_nil
    end
  end
end
