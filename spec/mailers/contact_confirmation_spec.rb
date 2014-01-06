require "spec_helper"

describe ContactConfirmation do
  describe "receipt" do
    let(:mail) { ContactConfirmation.receipt }

    it "renders the headers" do
      mail.subject.should eq("Receipt")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
