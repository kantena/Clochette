describe Client do
  context "when first create" do
    it "have a name" do
      client = Client.new
      client.name.should not_empty
    end
  end
end
