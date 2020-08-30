# Niagara 

1. read [this](https://docs.scinet.utoronto.ca/index.php/Niagara_Quickstart) quickstart guide 
2. Watch video [here](https://support.scinet.utoronto.ca/education/go.php/370/content.php/cid/1383/ib/1//p_course/370)
3. Read FAQ [here](https://docs.scinet.utoronto.ca/index.php/FAQ)


#### Niagara login 
```
ssh -Y <USERNAME>@niagara.scinet.utoronto.ca
```

### File Transfer on Niagara 
[main ref](https://docs.scinet.utoronto.ca/index.php/Data_Management#Moving_data) 

UNDER 10mb
```
scp /home/mobaxterm/Desktop/testSCP.txt raywoo32@niagara.scinet.utoronto.ca:/home/n/nprovart/raywoo32/
```

OVER 10mb
```
scp /home/mobaxterm/Desktop/testSCP.txt raywoo32@nia-datamover1.scinet.utoronto.ca:/home/n/nprovart/raywoo32
```

### Loading modules on scinet
```
module load gcc/7.3.0
module load trinityrnaseq
```

