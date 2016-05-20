require 'csv'

class Eratos
=begin
1. 探索リストに2からxまでの整数を昇順で入れる。
2. 探索リストの先頭の数を素数リストに移動し、その倍数を探索リストから篩い落とす。
3. 上記の篩い落とし操作を探索リストの先頭値がxの平方根に達するまで行う。
4. 探索リストに残った数を素数リストに移動して処理終了。
=end
  def initialize(argv)
    @largest_integer = argv.to_i
  end

  def sieve
    return [] if !@largest_integer.is_a?(Numeric) || @largest_integer < 2
    search_values = (2..@largest_integer).to_a
    square_root_of = Math.sqrt(@largest_integer)
    remove_composite_number(square_root_of, search_values)
  end

  def remove_composite_number(square_root_of, search_values, prime_numbers = [])
    return prime_numbers.concat(search_values) if square_root_of < search_values[0]
    remove_composite_number(square_root_of, search_values.reject { |n| n % search_values[0] == 0 }, prime_numbers.push(search_values[0]))
  end

  def stdout
    puts sieve.to_csv.gsub(/,/, ', ')
  end
end

if __FILE__ == $0
  Eratos.new(ARGV[0]).stdout
end
