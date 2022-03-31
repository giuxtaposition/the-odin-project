# frozen_string_literal: true

def caesar_cipher(string, shift_number)
  encoded_string = []

  string.chars.each_with_index do |character, index|
    if empty_character?(character) | special_character?(character)
      encoded_string[index] = character
      next
    end

    encoded_character = encode_character(alphabet_number_of(character), shift_number)
    encoded_string[index] = keep_case(character, encoded_character)
  end

  encoded_string.join
end

def keep_case(original, encoded)
  upcase?(original) ? encoded.upcase : encoded
end

def upcase?(character)
  character.upcase == character
end

def empty_character?(character)
  character.gsub(' ', '').empty?
end

def special_character?(character)
  alphabet.find_index(character.downcase).nil?
end

def encode_character(alphabet_number, shift_number)
  if alphabet_number + shift_number < alphabet.length
    alphabet[alphabet_number + shift_number]
  else
    encode_character(alphabet_number, shift_number - alphabet.length)
  end
end

def alphabet_number_of(character)
  (alphabet.index character.downcase).to_i
end

def alphabet
  %w[a b c d e f g h i j k l m n o p q r s t u v w x y x]
end
