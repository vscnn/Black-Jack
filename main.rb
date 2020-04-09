require_relative 'interface'

def start
  i = Interface.new
  i.repl
end

start