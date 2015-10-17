class Dessert
  def initialize(name, calories)
    @name,@calories = name,calories
  end
  def healthy?
    return true if @calories<200
    return false
  end
  def delicious?
    return true
  end
  def name
    @name
  end
  def name=(name)
    @name = name
  end
  def calories
    @calories
  end
  def calories=(calories)
    @calories = calories
  end
end

class JellyBean < Dessert
  def initialize(flavor)
    @flavor = flavor
    @calories = 5
    @name = flavor + " jelly bean"
  end
  def flavor
    @flavor
  end
  def flavor=(flavor)
    @flavor = flavor
  end
  def delicious?
    return false if @flavor == "licorice"
    return true
  end
end
