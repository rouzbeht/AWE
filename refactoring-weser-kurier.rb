# Rouzbeh TorkiSharifabadi
# Refactoring Weser-Kurier Übung

require 'rubygems'
require 'hpricot'
require 'open-uri'

def main()
  doc = Hpricot.parse(open("http://www.weser-kurier.de"))
  link=[] ; i=0
  while ((doc/"h1")[i]) != nil
    link[i] = ((doc/"h1")[i]).at("a").attributes['href']
    href = 'http://www.weser-kurier.de'+link[i]
    input = (doc/"h1"/"a")[i]
    Deutch(input)
    final = doc.at("a").swap('<a class="normal-link" href="'+href+'">'+(input.inner_html))
    file=File.open("index.html", "a")
    New_Line(file, final)
    file.close()
    i += 1
  end
  Prompt()
end

def Deutch(x)
  x[/ä/] = "ae"
  x[/ö/] = "oe"
  x[/ü/] = "ue"
  x[/Ä/] = "AE"
  x[/Ö/] = "OE"
  x[/Ü/] = "UE"
  x[/ß/] = "ss"
end

def New_Line(y, z)
  y.puts("<h2>")
  y.puts(z)
  y.puts("</h2>"+"\n")
end

def Prompt()
  puts "Thas was a test for Weser Kurier website"
  puts "Now you can read the News Headlines"
  puts "Open the 'index.html' file in a browser"
end

main()