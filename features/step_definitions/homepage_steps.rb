Given(/^Hit home page with (\d+) user (\d+) loop (\d+) rampup$/) do |arg1, arg2, arg3|
	time = Time.now.utc.iso8601
	test do
		cache use_expires: true, clear_each_iteration: true
  		threads count: arg1.to_i, rampup:arg3.to_i, loops:arg2.to_i do
    			visit name: 'Application Home Page', url: 'http://www.test-app.com'
  		end
	end.run(
		path: "/home/vikas/Ruby-Jmeter/jmeter/apache-jmeter-2.10/bin/",
		file: "/home/vikas/Ruby-Jmeter/jmeter/jmx/#{time}.jmx",
		jtl: "/home/vikas/Ruby-Jmeter/jmeter/jtl/#{time}.jtl",
		properties: "/home/vikas/Ruby-Jmeter/jmeter/apache-jmeter-2.10/bin/jmeter.properties"
		)
	doc   = Nokogiri::XML(File.read("/home/vikas/Ruby-Jmeter/jmeter/jtl/#{time}.jtl"))
	xslt  = Nokogiri::XSLT(File.read("/home/vikas/Ruby-Jmeter/jmeter/apache-jmeter-2.10/extras/jmeter-results-detail-report_21.xsl"))
	html = xslt.transform(doc)
	file = File.open("/home/vikas/Ruby-Jmeter/jmeter/report/#{time}.html", "w")
  	file.write(html)
  	file.close
end
