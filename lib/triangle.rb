class Triangle
  attr_reader :a,:b,:c
  def initialize(a,b,c)
    @a=a
    @b=b
    @c=c
  end

  def kind
    validate_triangle
    if a == b && a == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def sides_arent_zero?
    if a > 0 && b > 0 && c > 0
      true
    else
      false
    end
  end

  def valid_triangle_sides?
    a + b > c && a + c > b && b + c > a
  end
  def validate_triangle
    raise TriangleError unless sides_arent_zero? && valid_triangle_sides?
  end
  class TriangleError < StandardError
    def message
      "This is an invalid triangle!"
    end
  end
end
