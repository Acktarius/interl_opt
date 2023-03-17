# interl_opt
compute an optimized interleave setting for xmr-stak, using multi-threads AMD gpu for mining

## this script is delivered “as is” and I deny any and all liability for any damages arising out of using this script

the purpose of this script if to optimise the interleave setting, using Xmr-Stak in Ubuntu 22.04 LTS, while mining with multi-threads amd gpu.

### The idea is to find a tempo which will minimize delay in a given hash bunch.

`git clone https://github.com/Acktarius/interl_opt.git`

`cd interl_opt`

`sudo chmod 755 interl_opt.sh`

make sure your "config.txt" file in your xmr-stak folder as the following output value :

`"output-file": "log.txt"`

move `interl_opt.sh` script in the folder where the log.txt file is created.

run the miner, at least couple of minutes to generate enough data.

run the bash script with sudo privilege as needed.

`./interl_opt.sh`

if needed, an interleave value will be suggested.

if there are still interleave messages after applying the previous compute value,
try to run the script again, to get a new value...
