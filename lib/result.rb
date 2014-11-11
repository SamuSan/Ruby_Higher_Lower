class Result
  class Equal
    def won?
      true
    end
  end

  class Lower
    def won?
      false
    end
    
    def name
      "lower"
    end
  end

  class Higher
    def won?
      false
    end

    def name
      "higher"
    end
  end
end