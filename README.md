# Code walk through for running RNA-seq on scinet super computer 
#### Please see other .md files for notes on specific topics 

### Logging into Niagara 
```
ssh -Y raywoo32@niagara.scinet.utoronto.ca
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

