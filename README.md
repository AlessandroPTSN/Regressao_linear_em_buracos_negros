# Regressao linear em buracos negros

Este trabalho tem como objetivo analisar a relação entre massa dos buracos negros e a velocidade de dispersão que Merritt havia observado e propor um modelo de regressão linear com base nessa relação.




# 1 Objetivos

Buracos negros são objetos que distorcem o espaço-tempo ao seu redor devido a serem super
densos e possuírem um poderoso campo gravitacional, criando assim, uma região que nada pode
escapar dela, nem mesmo a luz[1].

Observando eles, Merritt[2] em seus estudos percebeu que existia uma relação entre a massa
dos buracos negros e a velocidade de dispersão dos bojos (grupo de estrelas bem compactado dentro de uma formação estelar maior).



$$ \frac{M_{\bullet}}{10^8M_{\odot}} \approx 3,1 \left(  \frac{\nu_e}{200} \right)^4 $$



Neste trabalho estamos interessados em:  
- Com base na relação empírica da massa dos buracos negros com a velocidade de dispersão que Merritt[2] propôs, criar uma regressão linear.  
- Construir um modelo de regressão linear entre essas duas variaveis no software R[3].  
- E comparar a relação de Merritt com a regressão linear.  

# 2 Metodologia

Uma regressão linear é uma equação onde dado um yi temos uma função em xi que é
equivalente[4].


$$
yi = α + βxi + ϵi,  
$$



\[ yi = α + βxi + ϵi,\]  


Onde yi é uma observação de seu resultado, xi uma observação de uma variavel explicativa, α intercepto ou coeficiente linear, β o coeficiente de regressão ou coeficiente angular e ϵi o erro experimental para cada observação i.

# 3 Resultados
A partir da equação de Merritt, podemos aplicar o log em ambas as partes e obter a seguinte
equação.  

$$ \frac{M_{\bullet}}{10^8M_{\odot}} \approx 3,1 \left(  \frac{\nu_e}{200} \right)^4 $$

$$ log_{10}\left(\frac{M_{\bullet}}{10^8M_{\odot}}\right) \approx log_{10}\left(3,1 \left(  \frac{\nu_e}{200} \right)^4\right) $$ 

$$ log_{10}\left(\frac{M_{\bullet}}{M_{\odot}}\right) - log_{10}(10^8) \approx log_{10}(3,1) + log_{10}\left( \left(  \frac{\nu_e}{200} \right)^4\right)  $$

$$ log_{10}\left(\frac{M_{\bullet}}{M_{\odot}}\right) \approx (log_{10}(3,1)+8) + 4log_{10}\left(  \frac{\nu_e}{200} \right)  $$
 
Fazendo  $\alpha = (log_{10}(3,1)+8) = 8.4913$ e  $\beta = 4 $

obtemos uma regressão linear baseado no modelo impírico.  

$$log_{10}\left(\frac{M_{\bullet}}{M_{\odot}}\right) \approx 8.4913+ 4 log_{10}\left(  \frac{\nu_e}{200} \right) $$  

Os dados do arquivo "blackhole" foram coletados com o objetivo de analisar a relação entre a massa $M_{\bullet}$ de buracos negros supermassivos presentes no centro de galáxias e a velocidade de dispersão das estrelas em seus respectivos bojos [5].

Com a obtenção do modelo de Merritt, podemos criar uma regressão linear com base nos dados "blackhole" e fazer uma comparação dos dois modelos.

Utilizando os dados citados e o software R[3], foi gerado a regressão linear:
```{R}
blackhole <- read.csv("data")
fit <- lm(logm~logv, data=blackhole)
plot(blackhole$logv,blackhole$logm, 
     main=paste("correlação=",round(cor(blackhole$logv,blackhole$logm),2)),
     ylab="Log da massa do buraco negro",
     xlab="Log da velocidade de dispersão"
)
abline(fit, col = "red")
fit
```

<!--![image](https://user-images.githubusercontent.com/50224653/215665973-ead7a599-158b-4ac1-a35a-8ca622bad94e.png)!-->

![image](https://user-images.githubusercontent.com/50224653/215667532-e951fbcf-3951-4e8f-8aa7-abf2af01f734.png)



```{R}
Call:
lm(formula = logm ~ logv, data = blackhole)

Coefficients:
(Intercept)         logv  
      8.329        4.491  
```
Dado $y_1, y_2, \cdots, y_n$ os dados referentes a $\displaystyle log_{10}\left(\frac{M_{\bullet}}{M_{\odot}}\right)$ e $x_1, x_2, \cdots, x_n$ os dados referentes a $log_{10}\left(  \frac{\nu_e}{200} \right)$.Sejam $\alpha = 8.329$ intercepto ou coeficiente linear, $\beta = 4.491$ o coeficiente de regressão ou coeficiente angular e $\epsilon_i$ o erro experimental para cada observação i, de acordo com Kutner [6], podemos expressar a dependência entre $y$ e $x$ através da equação:

$$\displaystyle y_i = \alpha + \beta x_i + \epsilon_i  $$  
$$\displaystyle log_{10}\left(\frac{M_{\bullet}}{M_{\odot}}\right) = 8.329 + 4.491log_{10}\left(  \frac{\nu_e}{200} \right) + \epsilon_i  $$  
Nota-se que o modelo calculado no R é extremamente próximo ao modelo de Merritt.

$$\displaystyle log_{10}\left(\frac{M_{\bullet}}{M_{\odot}}\right) \approx 8.4913 + 4log_{10}\left(  \frac{\nu_e}{200} \right)$$  

# 4 Conclusões

Portanto podemos concluir que a relação empírica que Merritt fez entre a massa dos buracos negros com a velocidade de dispersão dos bojos é equivalente a regressão linear calculada no R.



# 5 Referências
1. Almeida CR. 2020 A pré-história dos buracos negros. Revista Brasileira de Ensino de Física 42.
2. Merritt D. 2000 Black holes and galaxy evolution. Dynamics of Galaxies: from the Early Universe
to the Present, eds. F. Combes, G. A. Mamon, V. Charmandaris. Astronomical Society of the Pacific
Conference Series 197.
3. R Core Team. 2017 R: A Language and Environment for Statistical Computing. R Foundation for
Statistical Computing Vienna, Austria.
4. Seltman HJ. 2012 Experimental Design and Analysis. Carnegie Mellon University.
5. Harris GLH. 2014 Globular clusters and supermassive black holes in galaxies: further analysis
and a larger sample. Monthly Notices of the Royal Astronomical Society 438.
6. Kutner M, Nachtsheim C, Neter J, Li W. 2004 Applied Linear Statistical Models - Fifth Edition.
New York: McGraw-Hill/Irwin.
