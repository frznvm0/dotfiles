def copy(str)
  IO.popen('xsel -i', 'w') { |f| f << str.to_s }
end

def paste
  `xsel`
end

# puts "hello world" | "cowsay"
class String
  def |(cmd)
    IO.popen(cmd.to_s, 'r+') do |pipe|
      pipe.write(self)
      pipe.close_write
      pipe.read
    end
  end
end

