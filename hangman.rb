# Rouzbeh T.Sharifabadi

word="bicycle"; wrong=""
puts output="-------"
7.times do
  input=gets
  for i in 0..word.length-1
    if input==word[i].chr+"\n"
      output[i]=word[i].chr
      check=true
    end
  end
  if not check
    wrong=wrong+input[0].chr
  end
  puts output+"  "+"( "+wrong+" )"
end