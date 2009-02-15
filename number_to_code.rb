class Integer
  WORDS_HASH = {
    "1" => "uno",
    "2" => "dos",
    "3" => "tres",
    "4" => "cuatro",
    "5" => "cinco",
    "6" => "seis",
    "7" => "siete",
    "8" => "ocho",
    "9" => "nueve",
    "10" => "diez",
    "11" => "once",
    "12" => "doce",
    "13" => "trece",
    "14" => "catorce",
    "15" => "quince",
    "16" => "dieciseis",
    "17" => "diecisiete",
    "18" => "dieciocho",
    "19" => "diecinueve",
    "20" => "veinte",
    "21" => "veintiuno",
    "22" => "veintidos",
    "23" => "veintitres",
    "24" => "veinticuatro",
    "25" => "veinticinco",
    "26" => "veintiseis",
    "27" => "veintisiete",
    "28" => "veintiocho",
    "29" => "veintinueve",
    "30" => "treinta",
    "40" => "cuarenta",
    "50" => "cincuenta",
    "60" => "sesenta",
    "70" => "setenta",
    "80" => "ochenta",
    "90" => "noventa",
    "100" => "cien",
    "200" => "doscientos",
    "300" => "trescientos",
    "400" => "cuatrocientos",
    "500" => "quinientos",
    "600" => "seiscientos",
    "700" => "setecientos",
    "800" => "ochocientos",
    "900" => "novecientos",
  }

  def to_words
    # size instead of count, it seems heroku doesn't support count
    digits = self.to_s.split("").size 
    if self < 31
      return "" if self == 0
      return WORDS_HASH[self.to_s]
    elsif self < 100
      return WORDS_HASH[self.to_s] if self % 10 == 0
      return WORDS_HASH[(self/10*10).to_s] + " y " + (self % 10).to_words
    elsif self < 1000
      return WORDS_HASH[self.to_s] if self % 100 == 0
      return "ciento " + (self % 100).to_words if self < 200
      return (self/100*100).to_words + " " + (self % 100).to_words
    elsif self < 1000000
      return "mil" if self == 1000
      return (self/1000).to_words + " mil" if self % 1000 == 0
      return (self/1000).to_words + " mil " + (self % 1000).to_words 
    else
      return "Numero demasiado grande" if self > 999999999999
      return "un millon" if self == 1000000
      return "un millon " + (self % 1000000).to_words if self < 2000000
      return (self/1000000).to_words + " millones" if self % 1000000 == 0
      return (self/1000000).to_words + " millones " + (self % 1000000).to_words
    end
  end

  def commify
    self.to_s.reverse.gsub(/(\d\d\d)(?=\d)(?!\d*\.)/,'\1,').reverse
  end
end 
