# frozen_string_literal: true

def substrings(words, substrings)
  result = {}

  substrings.each do |string|
    to_array(words).each do |word|
      next unless word.include?(string)

      add_substring_to_hash(result, string)
    end
  end

  result
end

def add_substring_to_hash(hash, string)
  hash[string.to_s] = if substring_exists(hash, string)
                        increment_value(hash, string)
                      else
                        1
                      end
end

def to_array(string)
  string.downcase.split
end

def substring_exists(hash, string)
  !hash[string.to_s].nil?
end

def increment_value(hash, string)
  hash[string.to_s] + 1
end
