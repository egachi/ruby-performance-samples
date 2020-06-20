require 'stackprof'

def write_to_file(id)
    open('output.out', 'a') do | file |
        file.puts "RequestId #{ id } from report at #{ Time.new } \n" 
    end
end

def custom_method()
    reportnum = 1
    i = 1
    num = 21474

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


StackProf.run(mode: :cpu, out: 'stackprof-cpu-myapp.dump') do
    p "Starting Profiler"
    p fibonacci(42)
    custom_method()
    p "Finish method and profiler"
end
