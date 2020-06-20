require 'stackprof'

class HomeController < ApplicationController

  def write_to_file(id)
      open('output.out', 'a') do | file |
          file.puts "RequestId #{ id } from report at #{ Time.new } \n" 
      end
  end
  
  def custom_method()

      reportnum = 1
      i = 1
      num = 2147
  
      begin
          reportnum = reportnum * i;      
          #Open file
          write_to_file(i)
          i +=1;
       end until i > num

  end

  def fibonacci(n)
    if (n<=2)
      return 1
    else
      return (fibonacci(n-1)+fibonacci(n-2))
    end
  end
  
  
  def index

    start_time = Time.now

    StackProf.run(mode: :cpu, out: 'tmp/stackprof-cpu-myapp.dump', raw:true) do
      p "Starting Profiler"
      p fibonacci(41)
      custom_method()
      p "Finish method and profiler"
    end

    end_time = Time.now 
    
    elapsed_seconds = end_time.to_f - start_time.to_f

    @output = "Response back from method in #{elapsed_seconds}"

  end
end
