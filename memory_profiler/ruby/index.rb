require 'memory_profiler'

$objectList = Array[]

def saveObjects(objectID)
    numbers = objectID / 8
    array = Array[]
    a = 0
    begin
        array[a] = a
        a +=1;
    end until a > numbers

    return array
end

def home()
    i = 0
    num = 10000

    begin
        id = 1000 * 1024;
        objectId = saveObjects(id);
        $objectList.append(objectId);
        i +=1;
     end until i > num

     p "Finishing from method"
end

MemoryProfiler.start # Start Profiler
#Code running
home()
#Code running
report = MemoryProfiler.stop #Stop Profiler
report.pretty_print(to_file: 'profile.txt', detailed_report: true, normalize_paths: true)
#report.pretty_print(to_file: "profile.txt") Simple way