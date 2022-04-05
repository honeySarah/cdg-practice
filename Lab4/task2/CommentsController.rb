require './mainMethods.rb'
load 'Lab4/task2/Resource.rb'

class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    @comments.each.with_index do |comment, idx|
      puts "[#{idx}] #{comment}"
    end
  end

  def show
    print "Enter index of comment to show: "
    input = gets

    if int_argument_error?(input)
      puts "Index is incorrect. Please, write a number."
      return 'error'
    end

    idx = input.to_i

    if idx < 0 
      puts "Index must be 0 or higher."
      return 'error'
    end

    puts "[#{idx}] #{@comments[idx]}"
  end

  def create
    print "Write a comment: "
    comment = gets.chomp

    @comments << comment

    puts "Index of your comment: #{@comments.find_index(comment)}"
    puts "Text of your comment: #{comment}"
  end

  def update
    print "Enter index of comment to update: "
    input = gets

    if int_argument_error?(input)
      puts "Index is incorrect. Please, write a number."
      return 'error'
    end

    idx = input.to_i

    if idx < 0 
      puts "Index must be 0 or higher."
      return 'error'
    end

    puts "Text of comment with index #{idx}:"
    puts "#{@comments[idx]}"

    puts "Write a new comment:"
    @comments[idx] = gets.chomp
  end

  def destroy
    print "Enter index of comment to delete: "
    input = gets

    if int_argument_error?(input)
      puts "Index is incorrect. Please, write a number."
      return 'error'
    end

    idx = input.to_i

    if idx < 0 
      puts "Index must be 0 or higher."
      return 'error'
    end

    @comments.delete_at(idx)
  end
end