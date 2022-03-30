# frozen_string_literal: true

def bubble_sort(array_of_numbers)
  index = 0
  moved = false

  while index < array_of_numbers.length - 1
    current_number = array_of_numbers[index]
    next_number = array_of_numbers[index + 1]

    if current_number > next_number
      move_right(array_of_numbers, index)
      moved = true
    end
    index += 1
  end

  bubble_sort(array_of_numbers) if moved == true

  array_of_numbers
end

def move_right(array, index)
  array.insert(index, array.delete_at(index + 1))
end
