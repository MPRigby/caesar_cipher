# lib/caesar_cipher.rb
class CaesarCipher

  def self.shift (input, index=nil)
    if index.nil?
      raise "No shift index input."
    else
      output=""
      index = index%26 #correct indices over 26
      input.each_byte do |char_code|
        #capital letters
        if char_code>=65 && char_code<=90
          new_char_code = char_code + index
          if new_char_code > 90
            new_char_code = 64 + new_char_code-90
          elsif new_char_code < 65
            new_char_code = 91 - (65-new_char_code)
          end
        #lowercase letters
        elsif char_code>=97 && char_code<=122
          new_char_code = char_code + index
          if new_char_code > 122
            new_char_code = 96 + new_char_code-122
          elsif new_char_code < 97
            new_char_code = 123 - (97-new_char_code)
          end
        else
          new_char_code = char_code
        end
        output += new_char_code.chr
      end
      return output
    end
  end

end
