BUFFER = "buff.txt"

def float_arg?(*args)
  begin
    args.each do |arg|
      arg = Float(arg)
    end
  rescue ArgumentError
    true
  else
    false
  end
end

def index(file_name)
  File.foreach(file_name) { |line| puts line }
end

def find(file_name,id)
  File.foreach(file_name).with_index do |line, index|
     @res_line = line if index.equal?(id)
  end
  @res_line
end

def where(file_name, pattern)
  @line_id = []
  File.foreach(file_name).with_index do |line, index|
    @line_id.push(index) if line.include?(pattern)
  end
  @line_id
end

def update(file_name, id, text)
  file = File.open(BUFFER, 'w')
  File.foreach(file_name).with_index do |line, index|
    file.puts(id.equal?(index) ? text : line)
  end
  file.close
  File.write(file_name, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(file_name, id)
  file = File.open(BUFFER, 'w')
  File.foreach(file_name).with_index do |line, index|
    if !(id == index)
      file.puts(line)
    end
  end
  file.close
  File.write(file_name, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def files_equals?(first_file_name, sec_file_name)
  @equals_count = 0
  File.foreach(first_file_name) do |f_line|
    File.foreach(sec_file_name) do |s_line|
      if f_line.chomp.eql? s_line.chomp
        @equals_count += 1
        break
      end
    end
  end
  first_file = File.open(first_file_name, 'r')
  sec_file = File.open(sec_file_name, 'r')
  f_f_lines_count = first_file.readlines.size
  # puts(@equals_count)
  f_f_lines_count == @equals_count && f_f_lines_count == sec_file.readlines.size
end