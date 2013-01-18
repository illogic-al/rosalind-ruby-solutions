module Gandalf
  def self.the_validator(input)
    if File.file?(input)
      puts "You've been sent back until your task is done."
      input = File.read(input)
    elsif input.is_a?(String)
      puts "The board is set... the pieces are moving."
      input
    else
      message = "You are not a String! You are not a File!"
      message += "\n The dark fire will not avail you, unknown entity!"
      message += " Go back to the shadow."
      message += "\n YOU! SHALL NOT! PASS!"
      abort(message)
    end
  end
end
