phrase = "Howdy partner, sit down! How's it going?"
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  arrayed_string = string.downcase.gsub(/[[:punct:]]/, '').split
  hash = Hash[dictionary.collect { |word| [word, 0]}]

  for word in arrayed_string do
    for dictionary_word in dictionary do
      if word.match?(dictionary_word)
          hash[dictionary_word] += word.match(dictionary_word).length
      end #end IF statement
    end #end inner FOR statement
  end #end outer FOR statement

  hash.delete_if { |k, v| v == 0 }
end #end METHOD

p substrings(phrase, dictionary)
