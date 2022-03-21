def ceasar_cipher(string, number)
  ascii_answer = string.bytes.map do |num|

    case
      #when num = a space or a punctuation mark
      when /[[:blank:]]/.match?(num.chr) || /[[:punct:]]/.match?(num.chr)
        num

      when num.between?(65, 90)
        #rotation if needed
        if num + number > 90
          num = (num + number) - 90 + 64
        else #no rotation required
          num + number
        end

      when num.between?(97, 122)
        #rotation if needed
        if num + number > 122
          num = (num + number) - 122 + 96
        else #no rotation required
          num + number
        end

    end #end case expression
  end #end #map sequence

 puts ascii_answer.pack('c*')
end #ceasar_cipher
