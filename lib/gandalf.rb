module Gandalf
  def self.the_validator(input)
    if File.file?(input)
      puts "Gandalf says:\n\t\"I've been sent back until my task is done.\""
      input = File.read(input).chomp
    elsif input.is_a?(String)
      puts "Gandalf says:\n\t\"The board is set... the pieces are moving.\""
      input
    else
      message = "\"You are not a String! You are not a File!"
      message += "\n The dark fire will not avail you, unknown entity!"
      message += " Go back to the shadow."
      message += "\n YOU! SHALL NOT! PASS!\""
      abort(message) # we should never ever see this bit of ridiculousness
    end
  end
end
