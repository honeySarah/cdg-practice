require './mainMethods.rb'
load 'Lab4/task2/Resource.rb'

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each.with_index do |post, idx|
      puts "[#{idx}] #{post}"
    end
  end

  def show
    print "Enter index of post to show: "
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

    puts "[#{idx}] #{@posts[idx]}"
  end

  def create
    print "Write a post: "
    post = gets.chomp

    @posts << post

    puts "Index of your post: #{@posts.find_index(post)}"
    puts "Text of your post: #{post}"
  end

  def update
    print "Enter index of post to update: "
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
    puts "#{@posts[idx]}"

    puts "Write a new comment:"
    @posts[idx] = gets.chomp
  end

  def destroy
    print "Enter index of post to delete: "
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

    @posts.delete_at(idx)
  end
end