module Gandalf
  def self.the_validator(input)
    # We'll eat nummy newlines and other whitespace with 'strip' method
    # after testing them. Only the virtuous shall pass.

    if File.file?(input)
      input = File.read(input).strip
    end

    if input.is_a?(String) # die if we contain anything other than the values below
      if input.gsub(/[ACGTUNXacgtunx-]/, "").strip.empty?
        puts "Gandalf says:\n\t\"The board is set... the pieces are moving.\""
        input.strip
      else
        message = "You have characters that aren't valid nucleotides."
        message << "\nYou! Shall not! PAAAAAAAAAAAAAAAAAAAAAASS!"
        abort(message) 
      end
    end
  end
end
