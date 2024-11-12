# force_amplifying_control_2DOF

# Environnement
Il est constitué de l'organe à opérer et de l'utilisateur. 

# Objective: Modélise la comanipulation: 
Un capteur d’efforts mesure les efforts exercés sur le robot par son environnement. Dans le cas 
particulier de la robotique chirurgicale, cet environnement peut être constitué à la fois du chirurgien
 et d’un organe. En ajoutant un deuxième capteur d’efforts au système, les efforts appliqués par le 
chirurgien sur le robot et ceux appliqués par l’organe sur le robot peuvent être dissociés. Ainsi, en
 réalisant un équilibre particulier entre ces deux torseurs, il est possible de restituer à
 l’utilisateur une version amplifiée des efforts appliqués par le robot sur l’organe. Une étude de la 
stabilité d’un tel système est présentée ainsi que les résultats expérimentaux qui en découlent.

## Le módele

## Relation entre les Espaces Articulaire et Cartésien

- **Couple** ($\tau$) est associé au **mouvement angulaire ($q$)** dans l'espace articulaire.
- **Effort** ($w$) est associé à la **position ($X$)** dans l'espace cartésien.

De meme, la transformation entre le couple($\tau$) et l'effort ($w$) est réalisée par la 
matrice Jacobienne ($J$), qui mappe les variables de l'espace articulaire (où le couple agit) vers 
l'espace cartésien (où l'effort agit).

Mathématiquement, cette relation est donnée par la relation 2.1. Les couples articulaires produits par
 l’utilisateur $\tau_u$ , l’organe $\tau_e$ et les couples désirés $\tau_d$ se déduisent
 des torseurs d’efforts par la relation 2.1 :

$\tau_u = J^t w_u $

$\tau_e = J^t w_e $

$\tau_d = J^t w_d$

$\tag{2.1}$

Le correcteur utilisé compense les couples engendrés par l’action de la pesanteur.

