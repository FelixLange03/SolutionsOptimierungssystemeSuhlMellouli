## Teilfrage b
Die Modellierung könnte so funktionieren, dass aus x[i]>0 -> y[i] =1 folgt. Algebraisch bedeute dies, dass y[i] >= x[i] als Restriktion eingeführt wird. Siehe Kapitel 4.9. Dann kann die Constraint über sum{i in n} y[i] <= k gecheckt werden.
### Forderung A
Wenn höchstens k der Variablen > 0 sein sollen, reicht die Forderung F1. Wird nur die Forderung F1 angewandt, ist es möglich, dass x=0 aber y=1. Hier "zählen wir dann False Positives mit", 
was aber nicht schlimm ist. Sobald x > 0 ist, ist (sicher) y=1 und wir halten die Grenze somit auch sicher ein. Die False Positives sind eine Art "Puffer". Hope that makes sense...

### Forderung B
Genau anderer Fall. F2 reicht aus. Möglich ist hier, dass y=0 obwohl x>0 ist. Sicher ist jedoch dass x>0, wenn y=1. 

### Forderung C
Beide Forderungen notwendig. Argumentation analog. Wir dürfen hier keine "False Positives" erlauben.

## Teilfrage c
### Forderung D 
Die Restriktion j soll für y[j]=1 eingehalten werden. Die rechte Seite wird Null und eine Einhaltung gezwungen.

$$
\sum_{j=1}^n a_{ij} x_j - b_j \leq M \cdot \left( 1-y_j \right)
$$

Mit Forderung dass:
$$
\sum_{j=1}^n y_j \geq k 
$$

Wird sichergestellt, dass mindestens k Restriktionen eingehalten werden.

### Forderung E
Wenn y[j]=0 ist, kann nicht gefolgert werden, dass die LHS >= 0 ist, also die Restriktion nicht erfüllt. Da hier n-k Restriktionen gebrochen werden sollen, muss das zusätzlich enforced werden.

$$
\sum_{j=1}^n a_{ij} x_j - b_j \geq -M \cdot \left( \frac{y_j}{1} \right)
$$

Hiermit wird gesichert, dass für y[j]=0 die LHS >= 0 ist, also nicht erfüllt ist. Für y[j]=1 entsteht hier keine Einschränkung.

Die zweite Restriktion muss entsprechend angepasst werden.
$$
\sum_{j=1}^n y_j \leq k 
$$

Gute Werte für Big-M ergeben sich durch Abschätzung obere Schranke. Siehe unten.
## Teilfrage d
$$
\text{max } z = 2x_1 + 1.5x_2 \\
2x_1 + x_2 -1000 \leq 500 \cdot \left( 1 - y_1 \right) \\
x_1 + x_2 - 800 \leq 300 \cdot \left( 1 - y_2 \right) \\
y_1 + y_2 \geq 1 \\
x_1 \leq 400 \\
x_2 \leq 700 \\
x_1 , x_2 \geq 0 \\
$$

