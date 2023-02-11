# ls
alias l="ls -lF"
alias lm="ls -l | more"
 
# Clean out temporary files from current work dir
# ===============================================
alias clean='echo -n "Really clean this directory? ";
             read yorn;
             if test "$yorn" = "y"; then
                rm -f \#* *~ .*~ *% .*% *.bak .*.bak  *.tmp .*.tmp core a.out *.pyc;
                echo "Cleaned.";
             else
                echo "Not cleaned.";
             fi'

