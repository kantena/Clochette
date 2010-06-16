require 'culerity'

Before do
  $server ||= Culerity::run_server
  $browser = Culerity::RemoteBrowserProxy.new $server, {:browser => :firefox}
  @host = 'http://localhost:4567'
end

at_exit do
  $browser.exit if $browser
  $server.close if $server
end

Lorsque /^je vais sur la page (.*)$/ do |page|
  $browser.goto @host + path_to(page)
  assert_successful_response
end

Alors /^je peut voir le mois courant$/ do
  div = $browser.li(:id, 'current-month').html rescue nil
  div.should be_not_nil
end

Alors /^un total qui affiche 0$/ do
  pending # express the regexp above with the code you wish you had
end


def assert_successful_response
  status = $browser.page.web_response.status_code
  if(status == 302 || status == 301)
    location = $browser.page.web_response.get_response_header_value('Location')
    puts "Being redirected to #{location}"
    $browser.goto location
    assert_successful_response
  elsif status != 200
    tmp = Tempfile.new 'culerity_results'
    tmp << $browser.html
    tmp.close
    `open -a /Applications/Safari.app #{tmp.path}`
    raise "Brower returned Response Code #{$browser.page.web_response.status_code}"
  end
end
