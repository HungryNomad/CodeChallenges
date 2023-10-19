# Microvave class will convert 90 to '01:30'
class Microwave
  def initialize(time)
    # Extract numbers
    ones, tens, hundreds, thousands = time.to_s.chars.map(&:to_i).reverse()
    # Default nils to zeros
    thousands ||= 0; hundreds ||= 0; tens ||= 0
    # Roll the tens over if >= 6
    if tens >= 6 then hundreds += tens / 6; tens = tens % 6; end;
    @timer = (thousands).to_s + (hundreds).to_s + ':' + tens.to_s + ones.to_s
  end
  def timer
    @timer
  end
end
