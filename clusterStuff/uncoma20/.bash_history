ls
mkdir TP2
ls
cd TP2
pwd
pwd | clipcopy
ls
quit
logout
ls
ranger
cat
logout
cd TP2/
ls
logout
sinfo -o '%9P %5D %7X %5Y %4c %7Z %10N %11e'
sinfo -o '%9P %10N %t'
logout
ls -a
nano .bashrc 
vim .bashrc
ls
cd TP2/
sinfo -o '%9P %5D %7X %5Y %4c %7Z %10N %11e'
sinfo -o '%9P %10N %t'
ls
gcc serie.c -o serie
vim launch_serie
sbatch launch_serie 
vim launch_serie
sbatch --help
g
fg
sbatch launch_serie 
fg
vim launch_serie
cat launch_serie 
logout
man sinfo
sinfo -o '%9P %5D'
sinfo -o '%2P %5D'
sinfo -o '%#P %5D'
sinfo -o '%8P %5D'
sinfo -o '%10P %5D'
sinfo -o '%10P %2D'
sinfo -o '%10P %1D'
man sinfo
sinfo -o '%10P %1D %e'
sinfo -o '%10P %D %e'
man sinfo
sinfo -N -o '%10N %10e'
man sinfo
ls
cd TP2
ls
sbatch launch_serie 
vim launch_serie 
echo hola
echo "hola"
vim launch_serie 
squeue -j 164014
ls
cat salida.txt 
cat errores.txt 
cat serie.c 
ls
vim serie.c
vim launch_serie 
nodelist 
sinfo nodelist
sinfo --nodelist=1
sinfo --nodelist=nodo1
sinfo --nodelist=node1
sinfo -N -o '%10N %10t'
ls
vim launch_serie 
sbatch launch_serie 
cat salida.txt 
vim launch_serie 
cat salida.txt 
vim launch_serie 
sbatch launch_serie 
cat salida.txt 
vim launch_serie 
sbatch launch_serie 
cat salida.txt 
vim launch_serie 
cat launch_serie 
vim launch_serie 
sbatch  --nodelist=nodo13 launch_serie 
cat salida.txt 
vim launch_serie 
sbatch  --nodelist=nodo13 launch_serie 
cat salida.txt 
sbatch  --nodelist=nodo10 launch_serie && cat salida.txt 


cat salida.txt 
sbatch  --nodelist=nodo13 launch_serie 
scontrol show job 164024
sbatch sleep 20
vim sleepyJob
vim launch_serie 
vim sleepyJob 
sbatch sleepyJob 
scontrol show job 164027
sbatch sleepyJob 
squeue
man JOB STATE CODES
man JOB
man sbatch
squeue --help
man squeue
logout
sinfo
man sinfo
man squeue
ls
cd TP2/
ls
vim sleepyJob 
sbatch sleepyJob --nodelist=nodo1 && sbatch sleepyJob --nodelist=nodo1
squeue
ls
rm slurm*
ls
mv sleepyJob sleepyJob1
ls
cp sleepyJob1 sleepyJob2
ls
sbatch sleepyJob1 --nodelist=nodo1 && sbatch sleepyJob2 --nodelist=nodo1
squeue
scontrol show job 164265
ls
vim launch_serie 
vim sleepyJob1
rm sleepyJob2
cp sleepyJob1 sleepyJob2
ls
rm slurm*
ls
sbatch sleepyJob1 --nodelist=nodo1 && sbatch sleepyJob2 --nodelist=nodo1
squeue
vim sleepyJob
;s
ls
vim sleepyJob1
rm sleepyJob2
cp sleepyJob1 sleepyJob2
vim sleepyJob1
vim sleepyJob2
cat sleepyJob1 && cat sleepyJob2
sbatch sleepyJob1 && sbatch sleepyJob2
squeue
man squeue
ls
sbatch sleepyJob1 --parsable
squeue
sbatch --parsable sleepyJob1
queue
squeue
xclip --version
xlcip
xclip
ls
vim JobID
ls
module avail
dnf --version
cd TP2
ls
rm slurm*
ls
echo hola > JobID 
cat JobID 
echo asd > JobID 
cat JobID 
cat JobID > JobID 
cat JobID 
(cat JobID) > JobID 
cat JobID 
sbatch --parsable sleepyJob1 > JobID 
cat JobID 
echo (cat JobID)
sbatch --parsable sleepyJob1 > JobID && sleep 2 && squeue && sleep 2 && scancel "$(cat JobID)" && sleep 1 && squeue
man squeue
fg
squeue
fg
sbatch --parsable sleepyJob1 > JobID && sleep 2 && squeue && sleep 2 && scancel "$(cat JobID)" && sleep 2 && squeue
sbatch --time=00:00:04 sleepyJob1
squeue
man sbatch
squeue
fg
vim sleepyJob1
cat sleepyJob1
vim sleepyJob1
sbatch --time=00:01:00 sleepyjob1 && sleep 2 && squeue && sleep 60 && squeue
sbatch --time=00:01:00 sleepyJob1 && sleep 2 && squeue && sleep 60 && squeue
squeue
scontrol show job 164280
ls
cp launch_serie trabajo
vim trabajo 
ls
sbatch trabajo 
cat salida.txt 
vim trabajo 
sbatch trabajo 
cat salida.txt 
free
git --version
pwd
ls
cd 3TP/
ls
gcc --version
man gcc
ls
rm 2Bx
rm 2BxOptimized 
ls
gcc -O 2Bex.c 
gcc -O3 2Bex.c 
ls
rm a.out 
gcc -O0 2Bex.c  -o 2BExecOpt0
gcc -O3 2Bex.c  -o 2BExecOpt3
sbatch 2BExecOpt0
vim sb2B
echo "./2BExecOpt0" > sb2B 
cat sb2B 
sbatch sb2B 
vim sb2B 
sbatch sb2B 
scontrol show job 164378
vim sb2B 
sbatch sb2B 
vim JobID
sbatch --parsable sb2B > JobID 
ls
cat slurm-"$(cat JobID)".out
mv sb2B  sb2BO0 
cp sb2BO0 sb2BO3
vim sb2BO3
ls
vim sb2BO0
ls
rm slurm*
ls
rm README.md 
ls
logout
ls
cd 3TP/
ls
mkdir 1
ls
mv 1 1P
ls
mv 1ex.md 1P
ls
ls 1P/
mkdir 2P
mv 2Aex.c 2Bex.c 2BExecOpt0 2BExecOpt3 sb2BO0 sb2BO3 JobID  2P
ls
cd 2P/
ls
mkdir ASec
mv 2Aex.c  ASec/
mkdir Bsec
ls
lsls
ls
mv !(ASec) Bsec/
mv !(*Sec) Bsec/
man shopt
shopt --version
shopt -s extglob
mv !(*Sec) Bsec/
mv !(ASec|Bsec/) Bsec/
mv !(ASec|Bsec) Bsec/
ls
ls Bsec/
ls -C
cd Bsec/
ls -C
ls -1
ls -X
ls -lX
ls -CX
ls -1X
vim 2BExecOpt0
vim sb2BO0
sbatch --parsable sb2BO0 && sbatch --parsable sb2BO3
ls
ls -1X
rm slurm-164405.out 
vim sb2BO3
vim sb2BO0
fg
sbatch --parsable sb2BO0 && sbatch --parsable sb2BO3
ls
cat 2BEO0
cat 2BEO0.out && echo "\n" && cat 2BEO3.out 
cat 2BEO0.out && echo "" && echo "" && cat 2BEO3.out 
ls
vim 2Bex.c 
gcc -O0 2Bex.c -o 2BExecOpt0 && gcc -O3 2Bex.c -o 2BExecOpt3
sbatch --parsable sb2BO0 && sbatch --parsable sb2BO3
cat 2BEO0.out && echo "" && echo "" && cat 2BEO3.out 
echo "Optimizacion Original" && cat 2BEO0.out && echo "" && echo "Optimizacion tipo 3" && cat 2BEO3.out 
sbatch --parsable sb2BO0 && sbatch --parsable sb2BO3
echo "Optimizacion Original" && cat 2BEO0.out && echo "" && echo "Optimizacion tipo 3" && cat 2BEO3.out 
gcc -O0 2Bex.c -o 2BExecOpt0 && gcc -O3 2Bex.c -o 2BExecOpt3
sbatch --parsable sb2BO0 && sbatch --parsable sb2BO3
echo "Optimizacion Original" && cat 2BEO0.out && echo "" && echo "Optimizacion tipo 3" && cat 2BEO3.out 
cd ../
mkdir 3P
ls
cd 3TP/
ls
cd 2P/
ls
cd Bsec
ls
rm *
ls
pwd
ls
cd 
ls
mv 2Bx 3TP/2P/Bsec/
cd 3TP/
ls
cd 2P/
ls
cd Bsec/
ls
cd ../
ls
cd TP2/
ls
cp launch_serie dummy
ls
mv dummy ../
cd ../
ks
ls
mv dummy 3TP/2P/Bsec/
cd 3TP/2P/Bsec/
ls
vim
ls
ls -a
vim dummy 
sbatch dummy 
ls
cat salida.txt 
vim dummy 
cat errores.txt 
ls
rm 2Bx 
ls
gcc 2Bex.c -o 2Bx
sbatch dummy 
cat errores.txt 
ls
vim dummy 
sbatch dummy 
cat errores.txt 
cat 2Bex.c 
mv dummy testAlgoritmoInicial
cp testAlgoritmoInicial testAlgoritmoNuevo
vim testAlgoritmoNuevo 
sbatch testAlgoritmoNuevo 
sbatch testAlgoritmoInicial 
vim testAlgoritmoInicial 
vim testAlgoritmoNuevo 
sbatch testAlgoritmoNuevo 
vim testAlgoritmoInicial 
ls
sbatch testAlgoritmoInicial && sbatch testAlgoritmoNuevo 
squeue
cat erroresInicial.txt 
cat erroresNuevo.txt 
ls
vim testAlgoritmoInicial 
vim 2Bex.c 
gcc 2Bex.c -o vieja
vim 2Bex.c 
gcc 2Bex.c -o nueva
vim testAlgoritmoInicial 
vim testAlgoritmoInicial \
vim testAlgoritmoInicial 
vim testAlgoritmoNuevo 
ls
vim testAlgoritmoNuevo 
sbatch testAlgoritmoInicial 
sbatch  testAlgoritmoNuevo 
cat erroresInicial.txt 
cat erroresNuevo.txt 
pwd
ls
mv 3-2* 3TP/3P/
cd 3TP/3P/
ls
gcc 3-2ex.c -o oldX
gcc 3-2ex.c -o newX
ls
rm *X
ls
gcc 3-2ex.c -o Xnew
gcc 3-2ex.c -o Xold
ls
cd ../
ls
cd 2P/
ls
cd Bsec/
ls
cp testAlgoritmoInicial ../../3P/testAlgoritmoInicial 
cd ../../3P/
ls
vim testAlgoritmoInicial 
cp testAlgoritmoInicial testAlgoritmoNuevo
vim testAlgoritmoNuevo 
ls
sbatch testAlgoritmo*
ls
sbatch testAlgoritmoInicial  && sbatch testAlgoritmoNuevo 
squeue
ls
logout
ls
cd 3TP/
mkdir 4P
cd 4P/
pwd
cd 
ls
cd 3TP/4P/
ls
cd 
ls
logout
cd 3TP/3P/
ls
cat erroresNew.txt 
cat erroresOld.txt 
vim testAlgoritmoInicial 
vim 3-2ex.c 
vim 3-2Optex.c 
vim testAlgoritmoInicial 
gcc 3-2ex.c -o Xold
gcc 3-2Optex.c -o Xnew
sbatch testAlgoritmoInicial 
cat testAlgoritmoInicial  && cat testAlgoritmoNuevo 
sbatch testAlgoritmoNuevo 
squeue
cat erroresOld.txt 
cat erroresNew.txt 
mv testAlgoritmoInicial testAlgoritmo
vim testAlgoritmo
sbatch testAlgoritmo
squeue
cat erroresOld.txt 
cat erroresNew.txt 
vim testAlgoritmo
sbatch testAlgoritmo
squeue
cat erroresOld.txt 
vim testAlgoritmo
sbatch testAlgoritmo
squeue
cat erroresOld.txt 
vim testAlgoritmo
sbatch testAlgoritmo
squeue
cat erroresOld.txt 
cat salidaOld.txt 
vim ~/.bashrc 
source ~/.bashrc 
sfile
ls
vim sfile 
rm sfile 
ls
sfile
ls
vim sfile 
vim ~/.bashrc 
source ~/.bashrc 
sfile pepito jajaja
ls
vim pepito 
logout
ls
mv 4x 3TP/4P/
ls
cd 3TP/4P/
ls
man sfile
sfile
cd ..
ls
cd 3P/
ls
cat testAlgoritmo
logout
ls
cd 3TP/4P/
ls
vim ~/.bashrc 
source ~/.bashrc 
bashrc 
sfile a
sfile
ls
cat a
bashrc 
bashrc
source ~/.bashrc 
ls
sfile A
ls
vim A
rm !(4x)
ls
bashrc 
source ~/.bashrc 
sfile testByFunction 4x
ls
cat testByFunction 
bashrc 
source ~/.bashrc
ls
vim testByFunction 
cp testByFunction testByInLine
vim testByInLine 
ls
vim testByFunction && vim testByInLine 
ls
sbatch testByFunction && sbatch testByInLine 
squeue
scancel  166830 166831
squeue
sbatch testByFunction && sbatch testByInLine 
squeue
ls
cat erroresByFunction.txt 
ls
gcc 4ex.c -o 4x
sbatch testByFunction && sbatch testByInLine 
squeue
cat erroresByFunction.txt 
cat salidaByFunction.txt 
cat salidaByFunction.txt erroresByFunction.txt 
cat salidaInLine.txt erroresInLine.txt 
ls
mv 4x 4xOptNormal
ls
gcc -O3 4ex.c -o 4x
sbatch testByFunction && sbatch testByInLine 
squeue
cat salidaByFunction.txt erroresByFunction.txt 
cat salidaInLine.txt erroresInLine.txt 
logout
cd 3TP/5P/
ls
gcc Programa1.c -o p1
gcc Programa2.c -o p2
gcc Programa3.c -o p3
ls
sfile testP1 p1
sfile testP2 p2
sfile testP3 p3
ls
bashrc 
source ~/.bashr
source ~/.bashrc 
sfile testP1 p1
vim testP1
bashrc 
source ~/.bashrc 
sfile testP1 p1
sfile testP2 p2
sfile testP3 p3
vim testP1
bashrc
ls
vim testP1 && vim testP2 && vim testP3
sbatch testP1 && sbatch testP2 && sbatch testP3
squeue
ls
ls *.txt
cat salida_p*
cat salida_p* errores_p*
ls
a=1 && echo "${a}"
echo "${a}"
unset a
echo "${a}"
p=1
echo p
echo "$p"
cat errores_p"$p".txt salida_p"$p".txt && p=p+1
p=1
p="$(p+1)"
p=$(p+1)

echo "$p"
p=$(p+1)
p=1
p=$((a++))
echo "$p"
echo "$p++"
echo "$p"
p=$((p++))
echo "$p"
p=$((p++))
echo "$p"
p=$((p++))
echo "$p"
p=$((++p))
echo "$p"
p=$((++p))
echo "$p"
unset a
unset p
p=1
cat errores_p"$p".txt salida_p"$p".txt && p=$((++p))
cat salida_p"$p".txt errores_p"$p".txt && p=$((++p))
p=1
cat salida_p"$p".txt errores_p"$p".txt && p=$((++p))
ls
gcc Programa2.c -o p2
echo $p
p=1
echo $((p++)) && echo $((p))
echo $(p)
echo $((p))
p=1
p=1 && sbatch testP$((p++)) && sbatch testP$((p++)) && sbatch testP$((p))
squeue
p=1
cat salida_p"$p".txt errores_p"$p".txt && p=$((++p))
vim Programa2.c 
gcc Programa2.c -o p2
p=1
p=1 && sbatch testP$((p++)) && sbatch testP$((p++)) && sbatch testP$((p))
squeue
p=1
cat salida_p"$p".txt errores_p"$p".txt && p=$((++p))
ls
cd 3TP/
ls
cd 5P/
ls
mv 6ex.c ..
ls
cd ..
ls
mkdir 6P
mv 6ex.c 6P
cd 6P/
ls
pwd
ls
gcc 6ex.c -o 6x
gcc 6exOptimized.c -o 6xOpt
sfile testViejo 6x
sfile testViejo 6xOpt 
ls
sfile testViejo 6x
sfile testNuevo 6xOpt 
ls
cat test*
ls
sbatch testViejo && sbatch testNuevo 
squeue
ls
cat salida_6x.txt errores_6x.txt 
vim testNuevo 
vim testViejo 
sbatch testViejo && sbatch testNuevo 
squeue
ls
cat salida_6x.txt errores_6x.txt 
cat salida_6xOpt.txt errores_6xOpt.txt 
ls
rm raw.txt 
cd ../
ls
mkdir 7P
cd 7P/
ls
gcc 7ex.c -o 7x
gcc 7exOpt.c -o 7xOpt
cd 3TP/7P/
ls
cat 7exOpt.c 
ls
gcc 7ex.c -o 7x
gcc 7exOpt.c -o 7xOpt
sfile versionInicial 7x
sfile versionOptimizada 7xOpt 
ls
vim versionInicial && vim versionOptimizada 
sbatch versionInicial && sbatch versionOptimizada 
ls
squeue
ls
cat salida_7x.txt errores_7x.txt 
cat salida_7xOpt.txt errores_7xOpt.txt 
ls
gcc 7exOpt.c -o 7xOpt
sbatch versionInicial && sbatch versionOptimizada 
squeue
scancel 167786 167787
squeue
ls
vim versionInicial 
vim versionOptimizada 
sbatch versionInicial && sbatch versionOptimizada 
squeue
cat salida_7x.txt errores_7x.txt 
cat salida_7xOpt.txt errores_7xOpt.txt 
ls
cat 7exOpt.c 
gcc 7exOpt.c -o 7xOpt 
sbatch versionInicial && sbatch versionOptimizada 
squeue
scancel 167799 167800
squeue
vim versionInicial  && vim versionOptimizada 
sbatch versionInicial && sbatch versionOptimizada 
squeue
cat salida_7x.txt errores_7x.txt 
cat salida_7xOpt.txt errores_7xOpt.txt 
cd ../
ls
mkdir 8P
cd 8P/
cat /sys/devices/system/cpu/cpu0/cache/index2/size
cat /sys/devices/system/cpu/cpu0/cache/index2/coherency_line_size
ls
gcc 8ex.c -o 8x
sfile versionInicial 8x
sbatch versionInicial 
squeue
scancel 167810
vim versionInicial 
sbatch versionInicial 
squeue
squeue 
cat errores_8x.txt 
ls
vim versionInicial 
sbatch versionInicial 
squeue
cat errores_8x.txt 
cd 3TP/8P/
ls
rm !(*.c)
ls
sfile vIni 8ex.c a
vim vIni 
sfile vIni 8ex.c\ a
vim vIni 
sfile vOpt 8ex.c\ b
sbatch vIni && sbatch vOpt 
vim vIni 
gcc 8ex.c -o 8x
sfile vOpt 8x\ b
sfile vIni 8x\ a
vim vIni 
sbatch vIni && sbatch vOpt 
bashrc 
source ~/.bashrc 
sfile vIni 8x a
vim vIni 
bashrc
source ~/.bashrc 
sfile vIni 8x a
vim vI
vim vIni 
sfile vOpt 8x b
bashrc 
source ~/.bashrc 
vim vIni 1 8x a
sfile vIni 1 8x a
bashrc 
rm 1
sfile 1 vIni 8x a
vim vIni 
sfile 2 vOpt 8x b
vim vOpt 
ls
sbatch vIni & sbatch vOpt 
squeue
ls
cat salida_vOpt.txt errores_vOpt.txt 
squeue
cat salida_vIni.txt errores_vIni.txt 
cd 3TP/8P/
ls
gcc -g -Wall 8ex.c -o 8x
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt && echo "" && echo "" cat salida_vOpt.txt errores_vOpt.txt 
vim vIni 
vim vOpt 
sbatch vIni && sbatch vOpt 
vim 8ex.c 
ls
squeue
cat salida_vIni.txt errores_vIni.txt && echo "" && echo "" cat salida_vOpt.txt errores_vOpt.txt 
cat salida_vIni.txt errores_vIni.txt && echo "" && echo "" && cat salida_vOpt.txt errores_vOpt.txt
lscpu
lscpu | grep Flags | grep -oE 'mmx|sse[0-9_]*|avx[0-9]*|fma'
lscpu | grep -oE 'mmx|sse[0-9_]*|avx[0-9]*'
ls
cd 3TP/
mkdir 9P
ls
cd 9P/
ls
gcc 9ex.c -o 9x
gcc -Wall -g -msse4.2 9opt.c -o 9opt
sfile 1 vIni 9x 
sfile 2 vOpt 9opt
vim vIni 
vim vOpt
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt 
cat salida_vOpt.txt errores_vOpt.txt 
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt 
cat salida_vOpt.txt errores_vOpt.txt 
gcc -Wall -g -msse4.2 9opt.c -o 9opt
gcc -Wall -g -O3 -msse4.2 9opt.c -o 9opt
gcc -Wall -g -O0 9ex.c -o 9x
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt 
cat salida_vOpt.txt errores_vOpt.txt 
gcc -Wall -g -O3 -msse4.2 9opt.c -o 9opt
gcc -Wall -g -O0 9ex.c -o 9x
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt 
cat salida_vOpt.txt errores_vOpt.txt 
gcc -Wall -g -O0 9ex.c -o 9x
gcc -Wall -g -O3 -msse4.2 9opt.c -o 9opt
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt 
cat salida_vOpt.txt errores_vOpt.txt 
gcc -Wall -g -O0 9ex.c -o 9x
gcc -Wall -g -O3 -msse4.2 9opt.c -o 9opt
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt 
cat salida_vOpt.txt errores_vOpt.txt 
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt 
sbatch vIni && sbatch vOpt 
cat salida_vIni.txt errores_vIni.txt 
cat salida_vOpt.txt errores_vOpt.txt 
gcc -Wall -g -O0 9ex.c -o 9x
gcc -Wall -g -O3 -msse4.2 9opt.c -o 9opt
sbatch vIni && sbatch vOpt 
cat salida_vIni.txt errores_vIni.txt && echo "" && echo "" && cat salida_vOpt.txt errores_vOpt.txt 
vim 9ex.c 
vim 9opt.c 
gcc -Wall -g -O0 9ex.c -o 9x
gcc -Wall -g -O3 -msse4.2 9opt.c -o 9opt
sbatch vIni && sbatch vOpt 
cat salida_vIni.txt errores_vIni.txt && echo "" && echo "" && cat salida_vOpt.txt errores_vOpt.txt 
cd 3TP/
mkdir 10P
cd 10P/
ls
gcc -Wall -g -O3 -msse4.2 10exOpt.c -o 10opt
gcc -Wall -g -O0 10ex.c -o 10x
sfile 1 vIni 10x
sfile 2 vOpt 10opt 
vim vIni 
vim vOpt 
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt && echo "" && echo "" && cat salida_vOpt.txt errores_vOpt.txt
cd 3TP/
ls
mkdir extra
cd extra/
ls
gcc -O3 -g -Wall -msse4.2 extraVector.c -o eV
gcc -O0 -g -Wall extra.c -o e
ls
sfile 1 vIni e
vim vIni 
sfile 1 vOpt eV
vim vOpt 
sbatch vIni && sbatch vOpt 
squeue
cat salida_vIni.txt errores_vIni.txt && echo " " && echo " " && cat salida_vOpt.txt errores_vOpt.txt 
cd ..
ls
cd ..
ls
cat pepito 
rm pepito 
ls
cat sfile 
rm sfile 
ls
mkdir 4TP
ls
cd 4TP/
ls
gcc -fopenmp -O3 julia.c -o julia
sfile 1 vIni julia
vim vIni 
rm vIni 
vim launch_julia_omp
cat launch_julia_omp 
vim julia.c 
sbatch launch_julia_omp 
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
scancel 168385
vim launch_julia_omp 
sinfo
vim launch_julia_omp 
fg
sbatch launch_julia_omp 
squeue
ls
cat salida.txt 
squeue
cat salida.txt 
cat salida.txt  errores.txt 
squeue
cat salida.txt  errores.txt 
squeue
cat salida.txt  errores.txt 
squeue
cat salida.txt  errores.txt 
squeue
cat salida.txt  errores.txt 
vim launch_julia_omp 
lscpu
sinfo
sinfo -o '%9P %5D %7X %5Y %4c %7Z %10N %11e'
scontrol show nodes | grep -A 10 "Partition=Blade"
scontrol show nodes
sinfo -N -p Blade
sinfo -N -p Blade -o "%N %c %C %m"
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
cat salida.txt 
ls
squeue
cat salida.txt 
cat salida.txt  errores.txt 
squeue
cat salida.txt  errores.txt 
sinfo
ls
cat julia.c 
vim julia.c 
ls
fg
$ gcc -fopenmp -O3 julia.c -o julia
gcc -fopenmp -O3 julia.c -o julia
sbatch launch_julia_omp 
ls
cat salida.txt  errores.txt 
vim julia.c 
gcc -fopenmp -O3 julia.c -o julia
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
ls
pwd
pwd && echo julia_openmp.tga 
vin launch_julia_omp 
vim launch_julia_omp 
sbatch launch_julia_omp 
ls
cat *.txt
ls
vim launch_julia_omp 
sbatch launch_julia_omp 
cat *.txt
vim julia.c 
gcc -fopenmp -O3 julia.c -o julia
vim julia.c 
gcc -fopenmp -O3 julia.c -o julia
sbatch launch_julia_omp 
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
cat salida.txt errores.txt 
squeue
cat salida.txt errores.txt 
ls -lh julia_openmp.tga 
vim launch_julia_omp 
fg
sbatch launch_julia_omp 
squeue
cat salida.txt 
vim launch_julia_omp 
squeue
sbatch launch_julia_omp 
cat salida.txt 
cat salida.txt errores.txt 
cat launch_julia_omp 
vim launch_julia_omp 
squeue
scancel 168445
vim launch_julia_omp 
sinfo
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
cat salida.txt 
man sleep
man 4 sleep
man 1 sleep
man 2 sleep
man sleep 4
cat salida.txt 
vim launch_julia_omp 
cat salida.txt 
ls -lh julia_openmp.tga 
ls
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
cat salida.txt errores.txt 
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
cat salida.txt 
vim launch_julia_omp 
fg
sbatch launch_julia_omp 
squeue
cat salida.txt 
sbatch launch_julia_omp 
cat salida.txt 
vim launch_julia_omp 
sbatch launch_julia_omp 
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
cat salida.txt 
cat errores.txt 
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
cat salida.txt 
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
cat salida.txt 
vim launch_julia_omp 
sbatch launch_julia_omp 
squeue
vim launch_julia_omp 
cat salida.txt 
vim launch_julia_omp 
squeue
sbatch launch_julia_omp 
squeue
cat salida.txt 
lscpu
neofetch
free -h
vim launch_julia_omp 
cat launch_julia_omp 
ls
mkdir 1P
mv !(1P) 1P
ls
mkdir 2P
cd 2P/
ls
pwd
ls
gcc -Wall -g -O0 programa2.c p2T
gcc -Wall -g -O0 programa2Time.c -o p2T
sfile 3 vIni p2T 
vim vIni 
vim programa2Time.c 
vim vIni 
sbatch vIni 
squeue
vim test
sfile 3 test echo
vim test 
sbatch test 
ls
rm test 
ls
squeue
scancel 168463
scancel 168462
ls
vim vIni 
sbatch vIni 
squeue
cat salida_vIni.txt errores_vIni.txt 
vim vIni 
sbatch vIni 
squeue
cat salida_vIni.txt 
vim vIni 
sbatch vIni 
squeue
cat salida_vIni.txt 
cd ..
ls
cd 1P/
ls
vim launch_julia_omp 
sbatch launch_julia_omp 
ls
squeue
logout 
