# Making a Virtual Env

1. Make the Virtual environment 
```
> module load python/3.6
> virtualenv --no-download $SCRATCH/env
> source $SCRATCH/env/bin/activate
> pip install --no-index --upgrade pip
> pip install --no-index -r /home/n/nprovart/raywoo32/requirements.txt
> pip install numpy //did it for bug
```

2. Using the venv in a compute job/Activating env in future
```
> module load python/3.6
> source $SCRATCH/env/bin/activate
```
