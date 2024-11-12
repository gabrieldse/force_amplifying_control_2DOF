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
- **Effort** ($w$) est associé à la **position ($x$)** dans l'espace cartésien.

De meme, la transformation entre le couple($\tau$) et l'effort ($w$) est réalisée par la 
matrice Jacobienne ($J$), qui mappe les variables de l'espace articulaire (où le couple agit) vers 
l'espace cartésien (où l'effort agit).

Mathématiquement, cette relation est donnée par la relation 2.1. Les couples articulaires produits par
 l’utilisateur $\tau_u$ , l’organe $\tau_e$ et les couples désirés $\tau_d$ se déduisent
 des torseurs d’efforts par la relation 2.1 :
```math
\left\{\begin{matrix}\tau_d = J^t w_d
 \\ \tau_u = J^t w_u
 \\ \tau_e = J^t w_e
\end{matrix}\right.
```
Le correcteur utilisé compense les couples engendrés par l’action de la pesanteur.

## Módelisation 

La modélisation du robot a été réalisée dans le but d'analyser la stabilité et la passivité du système de commande. Tout d'abord, un modèle linéarisé a été utilisé pour décrire la dynamique du robot, représentée par l'Équation 2.18 :

```math
M(q)\ddot{q} + C(q, \dot{q})\dot{q} + \Gamma_v \dot{q} + G_g(q) = \tau - \tau_e - \tau_u
```
où :
- \( M(q) \) est la matrice d'inertie,
- \( C(q, \dot{q})\dot{q} \) représente les effets de Coriolis et centrifuges,
- \( \Gamma_v \dot{q} \) correspond aux effets dissipatifs, et
- \( G_g(q) \) modélise les effets de la gravité.

Pour simplifier le modèle et permettre une linéarisation partielle, une rétroaction tachymétrique proportionnelle a été introduite, permettant de définir le couple de commande \(\tau\) comme suit :

```math
\tau = -B\dot{q} + \hat{G}_g(q) + \hat{C}(q, \dot{q})\dot{q} + \tau_c
```

où \(B\) est une matrice de gains symétrique, et \(\tau_c\) est le nouveau vecteur de commande pour les couples articulaires. Pour garantir une modélisation adéquate dans le cadre d'une étude de passivité, plusieurs hypothèses ont été prises en compte :

1. **Hypothèse 1** : On suppose que les estimations de \(G_g(q)\) et \(C(q, \dot{q})\dot{q}\) sont exactes, ce qui donne :

```math
   \begin{cases}
   \hat{C}(q, \dot{q})\dot{q} = C(q, \dot{q})\dot{q} \\
   \hat{G}_g(q) = G_g(q)
   \end{cases}
```
   Avec cette hypothèse, le modèle se simplifie comme suit :

```math
   M(q)\ddot{q} + B\dot{q} = \tau_c - \tau_e - \tau_u
```
2. **Hypothèse 2** : On considère que le robot opère à proximité d'une configuration \(q_0\), où la matrice d'inertie \(M(q)\) et le jacobien \(J(q)\) peuvent être considérés comme constants :

```math
   \begin{cases}
   M(q) = M(q_0) = M \\
   J(q) = J(q_0) = J
   \end{cases}
```
   Ainsi, le modèle dans le domaine de Laplace s'écrit comme :
```math
   \mathcal{L}\{\dot{q}\} = Y_r(s)\mathcal{L}\{(\tau_c - \tau_e - \tau_u)\} \quad \text{avec} \quad Y_r(s) = (Ms + B)^{-1}
```
3. **Hypothèse 3** : On suppose que la matrice \( J(q) \) est de rang plein \( n \), ce qui garantit que le robot n'est pas dans une configuration singulière.

Ces hypothèses ont été essentielles pour simplifier l'analyse et appliquer des techniques de contrôle basées sur la passivité dans le modèle linéarisé.
```math
\tau = (Ms + B)^{-1} \dot{q}
```

Sur le domain temporél le módele dymanique du robot peut être décrit comme:
```math
\ddot{q} = M^{-1}(\tau_c-\tau_e-\tau_u - B* \dot{q})
```

