# from http://elinux.org/Debugging_The_Linux_Kernel_Using_Gdb
define dmesg
    set $__log_buf = $arg0
    set $log_start = $arg1
    set $log_end = $arg2
    set $x = $log_start
    echo "
    while ($x < $log_end)
        set $c = (char)(($__log_buf)[$x++])
        printf "%c" , $c
    end
    echo "\n
end
document dmesg
dmesg __log_buf log_start log_end
Print the content of the kernel message buffer
end

# should add https://github.com/gdbinit/Gdbinit
# also add Documentation/kdump/gdbmacros.txt
# also look at http://www.ibm.com/developerworks/aix/library/au-gdb.html

set detach-on-fork off
set follow-exec-mode new

# colorful prompt
# keep trailing space on next line
set prompt \033[0;32m(gdb)\033[0m

