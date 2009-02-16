class Flash 
  def self.start 
    @@flash = {:error => "", :notice => "" }
    @@display = {:error => false, :notice => false }
  end

  def self.set(type, msg)
    @@flash[type], @@display[type] = msg,true
  end

  def self.check(type)
    if @@display[type]
      tmp_var = ""
      tmp_var = @@flash[type]
      discard(type)
      tmp_var
    end
  end

  private

  def self.discard(type)
    @@flash[type] = ""
    @@display[type] = false
  end

end
