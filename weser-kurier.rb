# Rouzbeh TorkiSharifabadi

require 'rubygems'
require 'hpricot'
require 'open-uri'

doc = Hpricot.parse(open("http://www.weser-kurier.de"))
link=[]
i=0
  
while ((doc/"h1")[i]) != nil
  link[i] = ((doc/"h1")[i]).at("a").attributes['href']
  href = 'http://www.weser-kurier.de'+link[i]
  input = (doc/"h1"/"a")[i]
  input[/�/] = "ae"
  input[/�/] = "oe"
  input[/�/] = "ue"
  input[/�/] = "AE"
  input[/�/] = "OE"
  input[/�/] = "UE"
  input[/�/] = "ss"
  final = doc.at("a").swap('<a class="normal-link" href="'+href+'">'+(input.inner_html))
  
  file=File.open("index.html", "a")
  file.puts("<h2>")
  file.puts(final)
  file.puts("</h2>"+"\n")
  file.close()
  i += 1
end
