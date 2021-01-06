# Shell-script-study

ms.sh
  This script automate the creation of another scripts. The script create the project's file with header that contains all script description. The header can be update with the files config, version and description that was created in project's begin.
  Usage:
    $ ./ms.sh -n <project_name>
      - create a project
    $ cd <project_name>
    $ ./ms.sh -u <project_name>
      - update header's project

listausuarios.sh
  This script list the users of /etc/passwd sorted in alfabetic order and in upper case
  Usage: 
    $ ./listausuarios
      - list users of /etc/passwd
    $ ./listausuarios -s
      - list users of /etc/passwd sorted in alfabetic order
    $ ./listausuarios -u
      - list users of /etc/passwd in upper case
    $ ./listausuarios -s -u
      - list users of /etc/passwd in upper case and sorted in alfabetic order
      
ex_debug.sh
  This is an exemple of debug in shell script. There others ways for debugging a script, how to set -x and bash -xv
  Usage:
    $ ./ex_debug -d <level debug>
      - debug a simple loop in different levels. 1 for show number in sum and 2 for show the result of sum.
