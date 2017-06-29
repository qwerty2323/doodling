class Crypt
  attr_accessor :text

  def initialize(text)
    @text = text
  end
  
  def encrypt(value)
    Logger.history || Logger.start
    Logger.log(value)
    symbols = text.split('')
    symbols.each_with_index do |symbol, i|
      symbols[i] = (symbol.ord + value).chr        
    end
    @text = symbols.join
    self
  end
  
  def decrypt
    encrypt(-Logger.summary)
    Logger.restart
    self
  end
end

class Logger    
  @@history = []
  class << self
    def start
      puts ">>> Logger is watching..."
    end

    def restart
      @@history = []
    end
    
    def log(value)
      history << value
    end

    def history
      @@history
    end

    def summary
      history.reduce(:+) || history
    end
  end
end
