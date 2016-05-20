require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../eratosthenes')

describe Eratosthenes do
  describe 'sieve' do
    specify { expect(Eratosthenes.new(nil).sieve).to eq [] }
    specify { expect(Eratosthenes.new(1).sieve).to eq [] }
    specify { expect(Eratosthenes.new('2').sieve).to eq [2] }
    specify { expect(Eratosthenes.new(2).sieve).to eq [2] }
    # 120の時の素数リスト
    specify { expect(Eratosthenes.new(120).sieve).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113] }
  end

  describe 'stdout' do
    specify { expect { Eratosthenes.new(30).stdout }.to output("2, 3, 5, 7, 11, 13, 17, 19, 23, 29\n").to_stdout }
  end
end