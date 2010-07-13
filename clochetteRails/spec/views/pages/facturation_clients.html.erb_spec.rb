require 'spec_helper'

describe "/pages/facturation_clients" do
  before(:each) do
    render 'pages/facturation_clients'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/pages/facturation_clients])
  end
end
