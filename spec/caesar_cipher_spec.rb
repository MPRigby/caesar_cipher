# spec/caesar_cipher_spec.rb
require "caesar_cipher"

describe CaesarCipher do

  describe ".shift" do
    context "given an empty string" do
      it "returns an empty string" do
        expect(CaesarCipher.shift("", 5)).to eql("")
      end
    end

    context "given a string but no index" do
      it "raises error" do
        expect{CaesarCipher.shift("String")}.to raise_error("No shift index input.")
      end
    end

    context "given a single word string and a positive index" do
      it "shifts each character down alphabet by index" do
        expect(CaesarCipher.shift("string", 5)).to eql("xywnsl")
      end
    end

    context "given a capitalized string" do
      it "shifts each character, maintaining capitalization" do
        expect(CaesarCipher.shift("STRING", 7)).to eql("ZAYPUN")
      end
    end

    context "given a string containing spaces" do
      it "shifts each character, ignoring spaces" do
        expect(CaesarCipher.shift("Here is a string", 5)).to eql("Mjwj nx f xywnsl")
      end
    end

    context "given an index that will shift characters beyond z" do
      it "wraps characters beyond z to start at a" do
        expect(CaesarCipher.shift("The buzzy bee plays the xylophone", 12)).to eql("Ftq ngllk nqq bxmke ftq jkxabtazq")
      end
    end

    context "given a string containing numbers" do
      it "ignores numbers" do
        expect(CaesarCipher.shift("12 drummers played 100 songs", 17)).to eql("12 uilddvij gcrpvu 100 jfexj")
      end
    end

    context "given string containing punctuation" do
      it "ignores punctuation" do
        expect(CaesarCipher.shift("I AM A SHOUTY STRING! But I don't shout all the time; I only shout occasionally.", 23)).to eql("F XJ X PELRQV PQOFKD! Yrq F alk'q pelrq xii qeb qfjb; F lkiv pelrq lzzxpflkxiiv.")
      end
    end

    context "given a negative index" do
      it "shifts characters backwards" do
        expect(CaesarCipher.shift("Uh-oh, string!", -3)).to eql("Re-le, pqofkd!")
      end
    end

    context "given a negative index that would shift string beyond a" do
      it "shifts characters backwards, wrapping from a to z" do
        expect(CaesarCipher.shift("This is a string that had better shift backwards!", -10)).to eql("Jxyi yi q ijhydw jxqj xqt rujjuh ixyvj rqsamqhti!")
      end
    end

    context "given an index 26 or greater" do
      it "still shifts, mimicing wrapping the alphabet multiple times" do
        expect(CaesarCipher.shift("Here's a super shifting string!", 50)).to eql("Fcpc'q y qsncp qfgdrgle qrpgle!")
      end
    end

    context "given an index -26 or beyond" do
      it "still shifts backwards, mimicing wrapping the alphabet multiple times" do
        expect(CaesarCipher.shift("This is a string that had better shift backwards!", -35)).to eql("Kyzj zj r jkizex kyrk yru svkkvi jyzwk srtbnriuj!")
      end
    end

  end

end
