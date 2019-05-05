# Ruby-JMeter-Cucumber-Performance-Testing-Automation
Automate server side performance testing using Ruby, JMeter and Cucumber framework

## Execute JMeter script from Ruby - code snippet
```ruby
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
```
## Get Started
1. Clone this repo
2. Update `homepage_steps.rb` file with `JMeter` location details
3. Execute test cases using `cucumber -f html -o report.html`
4. `JMeter` report will be generated in `report` directory

## References
- http://flood-io.github.io/ruby-jmeter/
- https://github.com/flood-io/ruby-jmeter/issues/2

## Author
[Vikas Sanap](https://www.linkedin.com/in/vikassanap/)
